class Api::V1::Project::Contract::Default < Reform::Form
  property :title
  property :user_id

  validates :title, presence: true, length: { in: Constants::PROJECT_TITLE_RANGE_LENGTH }
end
