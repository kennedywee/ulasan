class Feature < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum :label, %w[open interesting in-development shipped closed], default: :open

  validates :title, presence: true

  def votes_count
    votes.sum(:value)
  end
end
