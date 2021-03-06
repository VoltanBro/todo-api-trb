class Api::V1::User::Contract::Create < Reform::Form
  property :email
  property :password

  validates :email, presence: true, format: { with: Constants::USER_EMAIL_REGEX }
end
