JWTSessions.algorithm = 'RS256'
JWTSessions.private_key = OpenSSL::PKey::RSA.generate(2048)
JWTSessions.public_key = JWTSessions.private_key.public_key
JWTSessions.access_exp_time = 1800
JWTSessions.refresh_exp_time = 1.day
