class Api::V1::RegistrationsController < ApplicationController
  def create
    endpoint operation: Api::V1::User::Operation::Create,
             options: { params: params }, different_handler: registration_handler
  end

  private

  def registration_handler
    {
      success: ->(result, **opts) { render json: result['serialized_model'], **opts, status: :ok },
      invalid: ->(result, **) { render json: result['contract.default'], status: :unprocessable_entity }
    }
  end
end
