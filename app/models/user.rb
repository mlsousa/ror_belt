class User < ApplicationRecord


  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, :password, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :name, :alias, :email, length: { minimum: 2}
  validates :password, length: { minimum: 8}

  has_many :bright_ideas
  has_many :bright_ideas_liked, through: :likes, source: :bright_ideas
  has_many :likes, dependent: :destroy


  has_secure_password
  before_save :downcase_email


  def downcase_email
    email.downcase!
  end
end
