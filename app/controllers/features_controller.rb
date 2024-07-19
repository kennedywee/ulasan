class FeaturesController < ApplicationController
  allow_unauthenticated_access only: %i[index]

  def index
    @features = Feature.all
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.create!(feature_params)
  end

  private
    def feature_params
      params.require(:feature).permit(:user_id, :board_id, :title, :description, :category)
    end
end
