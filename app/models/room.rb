class Room < ActiveRecord::Base
  extend FriendlyId

  has_many :reviews, dependent: :destroy
  has_many :reviewed_rooms, through: :reviews, source: :room
  belongs_to :user
  
  validates :title, length: { minimum: 5 }, presence: true
  validates :location, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
  validates :slug, presence: true

  mount_uploader :picture, PictureUploader
  friendly_id :title, use: [:slugged, :history]
    
  scope :most_recent, -> { order(id: :desc) }
  
  def complete_name
    "##{id} #{title}, #{location}"
  end

  def self.search(query)
    if query.present?
      where(['location ILIKE :query OR title ILIKE :query OR description ILIKE :query', query: "%#{query}%"])
    else
      scoped
    end
  end

end
