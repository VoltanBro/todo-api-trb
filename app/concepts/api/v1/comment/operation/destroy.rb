class Api::V1::Comment::Operation::Destroy < Trailblazer::Operation
  step :find_task
  step :find_comment
  fail :not_found
  step :destroy_task

  def find_task(ctx, current_user:, params:, **)
    ctx[:task] = current_user.tasks.find_by(id: params[:task_id])
  end

  def find_comment(ctx, task:, params:, **)
    ctx[:model] = task.comments.find_by(id: params[:id])
  end

  def not_found(ctx, **)
    ctx[:errors] = OpenStruct.new(error: 'Comment not found')
  end

  def destroy_task(_ctx, model:, **)
    model.destroy
  end
end
