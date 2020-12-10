class Api::V1::SessionsController < ApplicationController
  def login
    endpoint operation: Api::V1::Login::Operation::Login, different_handler: login_handler
  end

  private

  def login_handler
    {
      success: ->(result, **opts) { render json: result['token'], **opts, status: :ok },
      invalid: ->(result, **) { render json: result['errors'], status: :forbidden }
    }
  end
end
