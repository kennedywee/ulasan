class BoardsController < ApplicationController
  before_action :set_user, only: %i[ index show new create ]
  before_action :set_board, only: %i[ show edit update destroy ]

  def index
    @boards = @user.boards
  end

  def show
    @features = @board.features
  end

  def new
    @board = Board.new
  end

  def edit; end

  def create
    @board = Board.new(board_params)
    @board.user = @user

    if @board.save
      redirect_to @board, notice: "Board was succesfully created.", status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: "Board was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_url, notice: "Board was successfully destroyed.", status: :see_other
  end

  def to_param
    appname
  end

  private
    def board_params
      params.require(:board).permit(:appname, :content, :title, :description, :website, :company)
    end

    def set_user
      @user = Current.user
    end

    def set_board
      @board = Board.find_by!(appname: params[:id])
    end
end
