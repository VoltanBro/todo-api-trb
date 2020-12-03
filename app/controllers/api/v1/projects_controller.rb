class Api::V1::ProjectsController < ApplicationController
  def create
    endpoint operation: Api::V1::Project::Operation::Create({ 'current_user': current_user })
  end
end
