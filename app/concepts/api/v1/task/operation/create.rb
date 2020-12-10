class Api::V1::Task::Operation::Create < Trailblazer::Operation
  step Model(Task, :new)
  step :assign_project
  step Contract::Build(constant: Api::V1::Task::Contract::Default)
  step Contract::Validate()
  step Contract::Persist()
  step :serialized_model

  def assign_project(_ctx, params:, model:, **)
    model.project_id = params[:project_id]
  end

  def serialized_model(ctx, model:, **)
    ctx[:serialized_model] = TaskSerializer.new(model).serializable_hash.to_json
  end
end
