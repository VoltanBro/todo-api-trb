class Api::V1::Project::Operation::Index < Trailblazer::Operation
  step :find_projects
  step :serialized_model

  def find_projects(ctx, current_user:, **)
    ctx[:projects] = current_user.projects
  end

  def serialized_model(ctx, projects:, **)
    binding.pry
    ctx[:serialized_model] = ProjectSerializer.new(projects).serializable_hash.to_json
  end
end
