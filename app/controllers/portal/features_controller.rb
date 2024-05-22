class Portal::FeaturesController < PortalController
  before_action :set_feature, only: %i[show edit update destroy]

  def index
    @features = Feature.all
  end

  def show; end

  def new
    @feature = Feature.new
  end

  def edit; end

  def create
    @feature = Feature.new(feature_params)

    if @feature.save
      redirect_to [:portal, @feature], notice: 'Feature was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @feature.update(feature_params)
      redirect_to [:portal, @feature], notice: 'Feature was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @feature.destroy!
    redirect_to portal_features_url, notice: 'Feature was successfully destroyed.', status: :see_other
  end

  private

  def set_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:user_id, :board_id, :title, :description, :category, :vote_count)
  end
end
