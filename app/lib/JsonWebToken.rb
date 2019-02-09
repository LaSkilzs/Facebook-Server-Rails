class JsonWebToken




  def self.decode(token)
   decoded = JWT.decode(token, JWT_SECRET)[0]
   HashWithIndifferentAccess.new decoded

  # rescue JWT::ExpiredSignature,
  #   JWT::VerificationError => e
  #   raise ExceptionHandler::ExpiredSignature, e.message
  # rescue JWT::DecodeError, JWT::VerificationError => e
  #   raise ExceptionHandler::DecodeError, e.message
  end
 
end