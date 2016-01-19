class RegistrationsController < Devise::RegistrationsController

  private
  # User parameters 
  def sign_up_params
    params.require(:user).permit(:avatar, :username, :email, :password, :password_confirmation)
  end
  
  # Update user account parameters 
  def account_update_params
    params.require(:user).permit(:avatar, :username, :email, :password, :password_confirmation, :current_password)
  end
end