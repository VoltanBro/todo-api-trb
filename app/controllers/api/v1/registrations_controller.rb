class Api::V1::RegistrationsController < ApplicationController
  def create
    endpoint operation: Api::V1::User::Operation::Create
  end
end
