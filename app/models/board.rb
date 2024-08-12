class Board < ApplicationRecord
  belongs_to :user
  has_many :features
  has_rich_text :content

  # before_validation :format_appname

  validates :appname, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :description, presence: true
  validates :website, presence: true

  private

  def format_appname
    # Convert to lowercase, replace spaces with hyphens, and remove special characters
    self.appname = appname.to_s.downcase.gsub(/\s+/, "-").gsub(/[^a-z0-9\-]/, "")
  end
end
