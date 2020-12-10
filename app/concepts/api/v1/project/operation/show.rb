class Api::V1::Project::Operation::Show < Trailblazer::Operation
  step :find_project
  fail :not_found
  step :serialized_model

  def find_project(ctx, current_user:, **)
    params = ctx[:params]
    ctx[:model] = current_user.projects.find_by(id: params[:id])
  end

  def not_found(ctx, **)
    ctx[:errors] = { error: 'Project not found' }
  end

  def serialized_model(ctx, model:, **)
    ctx[:serialized_model] = ProjectSerializer.new(model).serializable_hash.to_json
  end
end
