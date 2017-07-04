class Like < ApplicationRecord
  belongs_to :user
  belongs_to :bright_idea
  has_many :bright_ideas
  has_many :users, through: :bright_ideas_liked
  has_many :likes, through: :bright_ideas, source: :users
  has_many :bright_ideas_liked, through: :likes, dependent: :destroy
end
