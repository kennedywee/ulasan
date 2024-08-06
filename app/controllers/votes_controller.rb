class VotesController < ApplicationController
  before_action :set_feature

  def create
    @vote = @feature.votes.find_or_initialize_by(user: Current.user)
    @vote.value = vote_params[:value]
    if @vote.save
      redirect_to @feature.board, notice: "Vote was successfully created."
    else
      redirect_to @feature.board, alert: "Unable to vote."
    end
  end

  def destroy
    @vote = @feature.votes.find_by(user: Current.user)
    @vote.destroy
    redirect_to @feature.board, notice: "Vote was successfully removed."
  end

  private

  def set_feature
    @feature = Feature.find(params[:feature_id])
  end

  def vote_params
    params.require(:vote).permit(:value)
  end
end
