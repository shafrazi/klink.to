class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.valid_password?(params[:password])
      token = encode_token(@user.id.to_s)
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid password or email"}, status: 422
    end
  end
end
