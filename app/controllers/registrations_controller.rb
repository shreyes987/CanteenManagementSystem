class RegistrationsController < Devise::RegistrationsController
  def new
    if(User.create!(sign_up_params))
      render json: {message: "User registered"}
    else
      render json: {message: "Unable to register user"}
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation , :username)
  end
end