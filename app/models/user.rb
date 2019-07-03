class User < ApplicationRecord
  attr_accessor :password_confirmation
  has_secure_password

  has_many :boards
  has_many :labels
  has_many :posts, through: :boards

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

  validates :name, length: { within: 3..100 },
                   format: { with: /\A[^[:cntrl:]\\<>\/&]*\z/ }, # Unicode, permissive
                   allow_blank: true

  before_validation :convert_email_to_downcase

  private

  def convert_email_to_downcase
    self.email = self.email.to_s.downcase
  end
end
