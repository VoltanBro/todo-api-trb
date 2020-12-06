class Api::V1::Project::Operation::Destroy < Trailblazer::Operation
  step :find_project
  step :destroy_project

  def find_project(ctx, current_user:, **)
    params = ctx[:params]
    ctx[:model] = current_user.projects.find_by(id: params[:id])
  end

  def destroy_project(ctx, model:, **)
    model.destroy
  end
end
