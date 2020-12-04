class Api::V1::SessionsController < ApplicationController
  def create
    endpoint operation: Api::V1::Login::Operation::Create, different_handler: login_handler
  end

  private

  def login_handler
    {
      success: ->(result, **opts) { render json: result['token'], **opts, status: :ok },
      invalid: ->(result, **) { render json: result['contract.default'].errors, serializer: ErrorSerializer, status: :unprocessable_entity }
    }
  end
end
