class Api::V1::CommentsController < ApplicationController
  before_action :authorization

  def create
    endpoint operation: Api::V1::Comment::Operation::Create, options: default_options,
             different_handler: comment_handler
  end

  def show
    endpoint operation: Api::V1::Comment::Operation::Show, options: default_options,
             different_handler: comment_handler
  end

  def destroy
    endpoint operation: Api::V1::Comment::Operation::Destroy, options: default_options,
             different_handler: comment_handler
  end

  def comment_handler
    {
      success: ->(result, **opts) { render json: result['serialized_model'], **opts, status: :ok },
      invalid: ->(result, **) { render json: result['errors'], status: :not_found }
    }
  end
end
