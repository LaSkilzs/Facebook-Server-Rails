module ExceptionHandler
  extend ActiveSupport::Concern

  class DecodeError < StandardError; end
  class ExpiredSignature < StandardError; end

    included do
    rescue_from ExceptionHandler::DecodeError do |_error|
      render json: { message: "Access denied! Invalid token supplied." }
      end

    rescue_from ExceptionHandler::ExpiredSignature do |_error| 
      render json: { message: "Access denied!. Token has expired." }
    end
  end
end