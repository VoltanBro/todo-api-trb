class Api::V1::Login::Operation::Authorization < Trailblazer::Operation
  step :access_token
  fail :invalid_token
  step :decode_token
  fail :decode_fail
  step :current_user

  private

  def access_token(ctx, request:, **)
    ctx[:token] = request.headers['access']
  end

  def invalid_token(ctx, **)
    ctx[:errors] = 'Token is invalid'
  end

  def decode_token(ctx, token:, **)
    ctx[:decoded_token] = JWT.decode token, JWTSessions.public_key, true, { algorithm: 'RS256' }
  end

  def decode_fail
    ctx[:errors] = 'Token is invalid'
  end

  def current_user(ctx, decoded_token:, **)
    ctx[:current_user] = User.find_by(id: decoded_token.first.dig('user_id'))
  end
end
