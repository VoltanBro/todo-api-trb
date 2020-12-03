class Api::V1::UsersController < ApplicationController
  def create
    Api::V1::User::Operation::Create.call(params: params)
  end
end
