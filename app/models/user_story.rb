class UserStory < ApplicationRecord
  validates :title, presence: true
  validates :number, presence: true
end
