class RoomPresenter
  delegate :id, :user, :created_at, :description, :location, :title, :to_param, to: :@room

  def self.model_name
    Room.model_name
  end

  def initialize(room, context, show_form=true)
    @context = context
    @room = room
    @show_form = show_form
  end

  def can_review?
    @context.user_signed_in?
  end

  def show_form?
    @show_form
  end

  def review
    @review ||= @room.reviews.
      find_or_initialize_by(user_id: @context.current_user.id)
  end

  def has_user_review?
    @review.points
  end

  def review_route
    [@room, review]
  end

  def route
    @room 
  end

  def review_points
    Review::POINTS
  end

  def to_partial_path
    'room'
  end

  def stars
    @room.reviews.stars
  end

  def total_reviews
    (@room.reviews.size if self.stars > 0) || 0
  end

  def picture_url
    @room.picture_url
  end

  def thumb_url
    @room.picture.thumb.url
  end

  def has_picture?
    @room.picture?
  end
end
