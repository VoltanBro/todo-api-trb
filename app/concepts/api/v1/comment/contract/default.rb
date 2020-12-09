class Api::V1::Comment::Contract::Default < Reform::Form
  property :body
  property :task_id

  validates :body, presence: true
end
