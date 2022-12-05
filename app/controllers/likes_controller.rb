class LikesController < ApplicationController
  def create
    like = Like.new(
      user_id: current_user.id,
      tweet_id: params[tweet_id],
    )
    if like.save
      render json: { message: "Like created successfully" }, status: :created
    else
      render json: { errors: like.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    like = Like.find_by(id: params[:id])
    like.destroy
    render json: { "message": "like successfully deleted." }
  end
end
