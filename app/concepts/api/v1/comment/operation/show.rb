class Api::V1::Comment::Operation::Show < Trailblazer::Operation
  step :find_task
  step :find_comment
  fail :not_found
  step :serialized_model

  def find_task(ctx, current_user:, params:, **)
    ctx[:task] = current_user.tasks.find_by(id: params[:task_id])
  end

  def find_comment(ctx, task:, params:, **)
    ctx[:model] = task.comments.find_by(id: params[:id])
  end

  def not_found(ctx, **)
    ctx[:errors] = { error: 'Comment not found' }
  end

  def serialized_model(ctx, model:, **)
    ctx[:serialized_model] = CommentSerializer.new(model).serializable_hash.to_json
  end
end
