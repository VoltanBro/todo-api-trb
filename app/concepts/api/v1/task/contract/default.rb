class Api::V1::Task::Contract::Default < Reform::Form
  property :name
  property :due_date
  property :user_id
  property :project_id

  validates :name, presence: true
  validates :due_date, presence: true
end
