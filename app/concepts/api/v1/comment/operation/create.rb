class Api::V1::Comment::Operation::Create < Trailblazer::Operation
  step Model(Comment, :new)
  step :assign_task
  step Contract::Build(constant: Api::V1::Comment::Contract::Default)
  step Contract::Validate()
  step Contract::Persist()
  step :serialized_model

  def assign_task(_ctx, params:, model:, **)
    model.task_id = params[:task_id]
  end

  def serialized_model(ctx, model:, **)
    ctx[:serialized_model] = CommentSerializer.new(model).serializable_hash.to_json
  end
end
