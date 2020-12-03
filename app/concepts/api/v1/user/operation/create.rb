class Api::V1::User::Operation::Create < Trailblazer::Operation
  step Model(User, :new)
  step Contract::Build(constant: Api::V1::User::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()
end
