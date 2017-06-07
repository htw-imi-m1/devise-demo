class UserStory < ApplicationRecord
  validates :title, presence: true
end
