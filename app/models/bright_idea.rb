class BrightIdea < ApplicationRecord
  belongs_to :user
  # has_many :bright_ideas_liked, through: :likes, dependent: :destroy
  # has_many :likes, through: :users, dependent: :destroy
  # has_many :users, through: :bright_ideas_liked

  has_many :users, through: :likes
  has_many :likes, dependent: :destroy

end
