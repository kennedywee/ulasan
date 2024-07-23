class User < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :features, dependent: :destroy

  has_secure_password validations: false

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(:name) }

  validates :name, :username, :email_address, :password, presence: true

  def current?
    self == Current.user
  end

  def deactivate
    transaction do
      sessions.delete_all
      update! active: false, email_address: deactivated_email_address
    end
  end

  private
    def deactived_email_address
      email_address&.gsub(/@/, "-deactivated-#{SecureRandom.uuid}@")
    end
end
