class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(registration_params)
    if @user.save
      token = encode_token(@user.id)
      render json: {user: @user, token: token}
    else
      render json: {error: @user.errors.full_messages}, status: 422
    end
  end

  private

  def registration_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
