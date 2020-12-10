class Api::V1::Login::Operation::Login < Trailblazer::Operation
  step :find_user
  fail :invalid_user
  step :authenticate
  step :payload
  step :session
  step :token

  def find_user(ctx, params:, **)
    ctx[:user] = User.find_by(email: params[:email])
  end

  def invalid_user(ctx, **)
    ctx[:errors] = 'Invalid email'
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
    ctx[:token] = session.login.to_json
  end
end
