class Api::V1::Login::Operation::Create < Trailblazer::Operation
  step :find_user
  step :authenticate
  step :payload
  step :session
  step :token

  def find_user(ctx, params:, **)
    ctx[:user] = User.find_by(email: params[:email])
  end

  def authenticate(ctx, params:, **)
    ctx[:user].authenticate(params[:password])
  end

  def payload(ctx, user:, **)
    ctx[:payload] = { user_id: user.id }
  end

  def session(ctx, payload:, **)
    ctx[:session] = JWTSessions::Session.new(payload: payload)
  end

  def token(ctx, session:, **)
    byebug
    session.login.to_json
  end
end
