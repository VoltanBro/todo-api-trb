class Api::V1::Task::Contract::Default < Reform::Form
  property :name
  property :due_date
  property :project_id

  validates :name, presence: true, length: { in: Constants::TASK_NAME_RANGE_LENGTH }
  validates :due_date, presence: true
end
