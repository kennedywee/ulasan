class BoardsController < ApplicationController
  before_action :set_user, only: %i[ new create ]
  before_action :set_board, only: %i[ show ]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user = @user

    if @board.save
      redirect_to @board, notice: "Board was succesfully created."
    else
     render :new
    end
  end

  private
    def board_params
      params.require(:board).permit(:appname, :title, :description, :website)
    end

    def set_user
      @user = Current.user
    end

    def set_board
      @board = Board.find(params[:id])
    end
end
