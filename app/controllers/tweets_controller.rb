class TweetsController < ApplicationController
  def create
    tweet = Tweet.new(
      user_id: current_user.id,
      text: params[:text],
    )
    if tweet.save
      render json: { message: "Tweet created successfully" }, status: :created
    else
      render json: { errors: tweet.errors.full_messages }, status: :bad_request
    end
  end

  def destroy # possibly mark tweets as deleted instead of actually deleting them?
    tweet = Tweet.find_by(id: params[:id])
    tweet.destroy
    render json: { "message": "Tweet successfully deleted." }
  end
end
