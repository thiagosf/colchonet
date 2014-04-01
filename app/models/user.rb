class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :rooms, dependent: :destroy
  
  EMAIL_REGEX = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  
  validates :email, uniqueness: true, presence: true
  validates :full_name, presence: true
  validates :location, presence: true
  validates :bio, length: { minimum: 30 }

  has_secure_password

  scope :confirmed, -> { where.not(confirmed_at: nil) }
  
  validate do
    errors.add(:email, :invalid) unless email.match(EMAIL_REGEX)
  end

  before_create do |user|
    user.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
    return if confirmed?

    self.confirmed_at = Time.current
    self.confirmation_token = ''
    save!
  end

  def confirmed?
    confirmed_at.present?
  end

  def self.authenticate(email, password)
    user = confirmed.
            find_by(email: email).
            try(:authenticate, password)
  end

  def name_for_select
    "##{self.id} - #{self.full_name}"
  end
end
