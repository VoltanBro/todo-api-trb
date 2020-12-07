class Api::V1::Project::Operation::Create < Trailblazer::Operation
  step Model(Project, :new)
  step :assign_current_user
  step Contract::Build(constant: Api::V1::Project::Contract::Default)
  step Contract::Validate()
  step Contract::Persist()
  step :serialized_model

  def assign_current_user(_ctx, current_user:, model:, **)
    model.user_id = current_user.id
  end

  def serialized_model(ctx, model:, **)
    ctx[:serialized_model] = ProjectSerializer.new(model).serializable_hash.to_json
  end
end
