class Portal::BoardsController < PortalController
  before_action :set_board, only: %i[show edit update destroy]

  def index
    @boards = Board.all
  end

  def show; end

  def new
    @board = Board.new
  end

  def edit; end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to [:portal, @board], notice: 'Board was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @board.update(board_params)
      redirect_to [:portal, @board], notice: 'Board was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board.destroy!
    redirect_to portal_boards_url, notice: 'Board was successfully destroyed.', status: :see_other
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:user_id, :title, :description, :website)
  end
end
