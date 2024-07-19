class FeaturesController < ApplicationController
  allow_unauthenticated_access only: %i[index]

  def index
  end

  def new
  end

  def create
  end
end
