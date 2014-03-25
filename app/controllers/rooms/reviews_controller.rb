class Rooms::ReviewsController < ApplicationController
  before_filter :require_authentication

  def create
    begin
      review = room.reviews.
        find_or_initialize_by(user_id: current_user.id)
      review.update!(review_params)
      head :ok
    rescue
      head :not_found
    end
  end

  def update
    create
  end

  private

    def room
      @room ||= Room.friendly.where.not({ user_id: current_user.id }).find(params[:room_id])
    end

    def review_params
      params.require(:review).permit(:points)
    end
end
