class User < ApplicationRecord


  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :password, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, :email, length: { minimum: 2}
  validates :password, length: { minimum: 8}

  has_many :playlist_songs, through: :playlist, source: :songs, dependent: :destroy
  has_one :playlist, dependent: :destroy
  has_many :songs, through: :playlist_songs, source: :playlist_songs




#   has_many :adds, dependent: :destroy

  has_secure_password
  before_save :downcase_email


  def downcase_email
    email.downcase!
  end
end
