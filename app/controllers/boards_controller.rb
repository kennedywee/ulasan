class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.create!(board_params)
  end

  private
    def board_params
      params.require(:board).permit(:user_id, :appname, :title, :description, :website)
    end
end
