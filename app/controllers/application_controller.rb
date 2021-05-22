class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def authenticate_user
    head :unauthorized unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      @user = User.find_by(id: user_id)
    end
  end

  def decoded_token
    if request.headers["Authorization"]
      token = request.headers["Authorization"].split(" ")[1]
      begin
        JWT.decode(token, secret, true, algorithm: "HS256")
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def encode_token(payload)
    JWT.encode(payload, secret)
  end

  def secret
    Rails.application.credentials.jwt[:secret_key]
  end
end
