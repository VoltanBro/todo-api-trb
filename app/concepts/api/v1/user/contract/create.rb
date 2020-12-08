class Api::V1::User::Contract::Create < Reform::Form
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  property :email
  property :password

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
