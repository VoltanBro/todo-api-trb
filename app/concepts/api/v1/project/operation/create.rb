class Api::V1::Project::Operation::Create < Trailblazer::Operation
  step Model(Project, :new)
  step Contract::Build(constant: Api::V1::Project::Contract::Create)
  # step Contract::Validate()
  step Contract::Persist()
  step :serialize_user

  def serialize_user(ctx, model:, **)
    ctx[:serialize_user] = UserSerializer.new(model).serializable_hash.to_json
  end
end
