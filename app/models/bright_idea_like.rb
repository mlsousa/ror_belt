class BrightIdeaLike < ApplicationRecord
  belongs_to :user
  belongs_to :bright_idea
  has_many :likes, through: :bright_ideas
  has_many :users, through: :likes


end
