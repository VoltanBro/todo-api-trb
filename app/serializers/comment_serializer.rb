class CommentSerializer
  include JSONAPI::Serializer
  attributes :body

  belongs_to :task
end
