class Api::V1::Login::Operation::Authorization < Trailblazer::Operation
  step :access_token
  fail :invalid_token, fail_fast: true
  step Rescue(JWT::ExpiredSignature, handler: :decode_fail) {
    step :decode_token
  }
  step :current_user

  private

  def access_token(ctx, request:, **)
    ctx[:token] = request.headers[:access]
  end

  def invalid_token(ctx, **)
    ctx[:errors] = 'Token is invalid'
  end

  def decode_token(ctx, token:, **)
    ctx[:decoded_token] = JWT.decode token, JWTSessions.public_key, true, { algorithm: 'RS256' }
  end

  def decode_fail(exception, ctx, **)
    ctx[:errors] = exception.message
  end

  def current_user(ctx, decoded_token:, **)
    ctx[:current_user] = User.find_by(id: decoded_token.first['user_id'])
  end
end
