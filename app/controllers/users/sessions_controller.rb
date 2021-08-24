# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    u = User.find_by_email(params[:user][:email])

    if u.nil? || u.active?
      super
    else
      flash[:alert] = 'Invalid Email or password' #and return
      #set_flash_message!(:notice, :invalid_email_or_password)
      respond_with resource, location: new_user_session_path
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
