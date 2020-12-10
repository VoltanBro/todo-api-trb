class Api::V1::ProjectsController < ApplicationController
  before_action :authorization

  def index
    endpoint operation: Api::V1::Project::Operation::Index, options: default_options,
             different_handler: project_handler
  end

  def create
    endpoint operation: Api::V1::Project::Operation::Create, options: default_options,
             different_handler: project_handler
  end

  def show
    endpoint operation: Api::V1::Project::Operation::Show, options: default_options,
             different_handler: project_handler
  end

  def update
    endpoint operation: Api::V1::Project::Operation::Update, options: default_options,
             different_handler: project_handler
  end

  def destroy
    endpoint operation: Api::V1::Project::Operation::Destroy, options: default_options,
             different_handler: project_handler
  end

  def project_handler
    {
      success: ->(result, **opts) { render json: result['serialized_model'], **opts, status: :ok },
      invalid: ->(result, **) { render json: result['errors'], status: :not_found }
    }
  end
end
