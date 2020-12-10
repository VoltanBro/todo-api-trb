class Api::V1::User::Operation::Create < Trailblazer::Operation
  step Model(User, :new)
  step Contract::Build(constant: Api::V1::User::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()
  step :serialized_model

  def serialized_model(ctx, model:, **)
    ctx[:serialized_model] = UserSerializer.new(model).serializable_hash.to_json
  end
end
