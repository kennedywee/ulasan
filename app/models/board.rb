class Board < ApplicationRecord
  belongs_to :user
  has_many :features

  validates :appname, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :website, presence: true
end
