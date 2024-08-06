class Vote < ApplicationRecord
  belongs_to :feature
  belongs_to :user

  validates :user_id, uniqueness: { scope: :feature_id, message: "can only vote once per feature" }
end
