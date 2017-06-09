
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:username, :last_name,
                                             :first_name, :email])
  end
