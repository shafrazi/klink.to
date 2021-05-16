class RegistrationsController < Devise::RegistrationsController
  def new
    render html: "hello from sign up"
  end

  def create
    @user = User.new(registration_params)
    if @user.save
      render json: @user
    else
      render json: {error: @user.errors.full_messages}, status: 422
    end
  end

  private

  def registration_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
