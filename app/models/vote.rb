class Vote < ApplicationRecord
  belongs_to :feature
  belongs_to :user

  validates :user_id, uniqueness: { scope: :feature_id, message: "can only vote once per feature" }
  validates :value, inclusion: { in: [ -1, 1 ], message: "must be either -1 or 1" }
end
