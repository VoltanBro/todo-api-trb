class TaskSerializer
  include JSONAPI::Serializer
  attributes :name
  attributes :complited
  attributes :due_date

  belongs_to :project
end
