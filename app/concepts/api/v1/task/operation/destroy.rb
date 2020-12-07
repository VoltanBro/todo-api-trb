class Api::V1::Task::Operation::Destroy < Trailblazer::Operation
  step :find_project
  step :find_task
  fail :not_found
  step :destroy_task


  def find_project(ctx, current_user:, params:, **)
    ctx[:project] = current_user.projects.find_by(id: params[:project_id])
  end

  def find_task(ctx, project:, params:, **)
    ctx[:model] = project.tasks.find_by(id: params[:id])
  end

  def not_found(ctx, **)
    ctx[:errors] =  OpenStruct.new(error: 'Task not found')
  end

  def destroy_task(ctx, model:, **)
    model.destroy
  end
end
