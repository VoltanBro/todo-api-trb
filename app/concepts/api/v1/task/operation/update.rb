class Api::V1::Task::Operation::Update < Trailblazer::Operation
  step :find_project
  step :find_task
  step Contract::Build(constant: Api::V1::Task::Contract::Default)
  step Contract::Validate()
  step Contract::Persist()
  step :serialized_model

  def find_project(ctx, params:, current_user:, **)
    ctx[:project] = current_user.projects.find_by(id: params[:project_id])
  end

  def find_task(ctx, project:, params:, **)
    ctx[:model] = project.tasks.find_by(id: params[:id])
  end

  def serialized_model(ctx, model:, **)
    ctx[:serialized_model] = TaskSerializer.new(model).serializable_hash.to_json
  end
end
