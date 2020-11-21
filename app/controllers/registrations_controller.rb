class RegistrationsController < Devise::RegistrationsController
  def new
    if(User.create!(sign_up_params))
      render json: {message: "User registered" , status: 200}
    else
      render json: {message: "Unable to register user" , status: :unprocessable_entity}
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation , :username)
  end
end