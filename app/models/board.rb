class Board < ApplicationRecord
  belongs_to :user
  has_many :features

  enum :label, %w[open interesting in-development shipped closed], default: :open

  validates :appname, presence: true
  validates :description, presence: true
  validates :website, presence: true
end
