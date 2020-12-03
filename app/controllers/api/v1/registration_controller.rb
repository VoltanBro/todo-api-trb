class Api::V1::RegistrationController < ApplicationController
  def create
    endpoint operation: Api::V1::User::Operation::Create
  end
end
