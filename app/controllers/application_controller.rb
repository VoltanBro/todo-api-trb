class ApplicationController < ActionController::API
  include SimpleEndpoint::Controller
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def default_cases
    {
      success: ->(result, **) { result.success? },
      invalid: ->(result, **) { result.failure? }
    }
  end

  def default_handler
    {
      success: ->(result, **opts) { render json: result['model'], **opts, status: :ok },
      invalid: ->(result, **) { render json: result['contract.default'].errors, serializer: ErrorSerializer, status: :unprocessable_entity }
    }
  end

  def endpoint_options
    { params: params }
  end
end
