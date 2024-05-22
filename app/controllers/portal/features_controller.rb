class Portal::FeaturesController < PortalController
  before_action :set_feature, only: %i[show edit update destroy]
  before_action :set_board
  before_action :set_user, only: :create

  def index
    @features = Feature.all
  end

  def show; end

  def new
    @feature = Feature.new
    @feature.board = @board
  end

  def edit; end

  def create
    @feature = Feature.new(feature_params)
    @feature.board = @board
    @feature.user = @user

    if @feature.save
      redirect_to [:portal, @board, @feature], notice: 'Feature was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @feature.update(feature_params)
      redirect_to [:portal, @board, @feature], notice: 'Feature was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @feature.destroy!
    redirect_to portal_board_features_url(@board), notice: 'Feature was successfully destroyed.', status: :see_other
  end

  private

  def set_feature
    @feature = Feature.find(params[:id])
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_user
    @user = current_user
  end

  def feature_params
    params.require(:feature).permit(:title, :description, :category, :vote_count)
  end
end
