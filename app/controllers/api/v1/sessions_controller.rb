class Api::V1::SessionsController < ApplicationController
  def create
    endpoint operation: Api::V1::Login::Operation::Create
  end
end
