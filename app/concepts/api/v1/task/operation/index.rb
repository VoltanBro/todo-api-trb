class Api::V1::Task::Operation::Index < Trailblazer::Operation
  step :find_project
  step :find_tasks
  step :serialized_model

  def find_project(ctx, current_user:, params:, **)
    ctx[:project] = current_user.projects.find_by(id: params[:project_id])
  end

  def find_tasks(ctx, project:, **)
    ctx[:tasks] = project.tasks
  end

  def serialized_model(ctx, tasks:, **)
    ctx[:serialized_model] = TaskSerializer.new(tasks).serializable_hash.to_json
  end
end
