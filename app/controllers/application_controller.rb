class ApplicationController < ActionController::API
  include SimpleEndpoint::Controller
  include JWTSessions::RailsAuthorization

  private

  def default_cases
    {
      success: ->(result, **) { result.success? },
      invalid: ->(result, **) { result.failure? }
    }
  end

  def default_handler
    {
      success: ->(result, **opts) { render json: result['serialized_model'], **opts, status: :ok },
      invalid: lambda { |result, **|
                 render json: result['contract.default'].errors,
                        serializer: ErrorSerializer, status: :unprocessable_entity
               }
    }
  end

  def authorization
    endpoint operation: Api::V1::Login::Operation::Authorization, options: { request: request },
             different_handler: authorization_handler
  end

  def default_options
    { params: params, current_user: @current_user }
  end

  def authorization_handler
    {
      success: ->(result, **) { @current_user = result['current_user'] },
      invalid: ->(result, **) { render json: result[:errors], status: :unauthorized }
    }
  end
end
