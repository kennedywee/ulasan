class Comment < ApplicationRecord
  belongs_to :feature
  belongs_to :user

  validates :content, presence: true
end
