class Api::V1::TasksController < ApplicationController
  before_action :authorization

  def index
    endpoint operation: Api::V1::Task::Operation::Index, options: default_options,
             different_handler: task_handler
  end

  def create
    endpoint operation: Api::V1::Task::Operation::Create, options: default_options,
             different_handler: task_handler
  end

  def show
    endpoint operation: Api::V1::Task::Operation::Show, options: default_options,
             different_handler: task_handler
  end

  def update
    endpoint operation: Api::V1::Task::Operation::Update, options: default_options,
             different_handler: task_handler
  end

  def destroy
    endpoint operation: Api::V1::Task::Operation::Destroy, options: default_options,
             different_handler: task_handler
  end

  def task_handler
    {
      success: ->(result, **opts) { render json: result['serialized_model'], **opts, status: :ok },
      invalid: ->(result, **) { render json: result['errors'], status: :not_found }
    }
  end
end
