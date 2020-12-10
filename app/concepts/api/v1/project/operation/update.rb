class Api::V1::Project::Operation::Update < Trailblazer::Operation
  step :find_project
  step Contract::Build(constant: Api::V1::Project::Contract::Default)
  step Contract::Validate()
  step Contract::Persist()
  step :serialized_model

  def find_project(ctx, params:, current_user:, **)
    ctx[:model] = current_user.projects.find_by(id: params[:id])
  end

  def serialized_model(ctx, model:, **)
    ctx[:serialized_model] = ProjectSerializer.new(model).serializable_hash.to_json
  end
end
