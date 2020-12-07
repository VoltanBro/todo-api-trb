class Api::V1::Task::Operation::Show < Trailblazer::Operation
  step :find_project
  step :find_task
  fail :not_found
  step :serialized_model

  def find_project(ctx, current_user:, params:, **)
    ctx[:project] = current_user.projects.find_by(id: params[:project_id])
  end

  def find_task(ctx, project:, params:, **)
    ctx[:task] = project.tasks.find_by(id: params[:id])
  end

  def not_found(ctx, **)
    ctx[:errors] =  { error: 'Task not found' }
  end

  def serialized_model(ctx, task:, **)
    ctx[:serialized_model] = TaskSerializer.new(task).serializable_hash.to_json
  end
end
