class Feature < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :title, presence: true
  validates :description, presence: true
end
