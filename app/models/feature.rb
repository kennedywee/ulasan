class Feature < ApplicationRecord
  belongs_to :user
  belongs_to :board

  enum :label, %w[open interesting in-development shipped closed], default: :open

  validates :title, presence: true
end
