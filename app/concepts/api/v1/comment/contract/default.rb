class Api::V1::Comment::Contract::Default < Reform::Form
  property :body
  property :task_id

  validates :body, presence: true, length: { in: Constants::COMMENT_BODY_RANGE_LENGTH }
end
