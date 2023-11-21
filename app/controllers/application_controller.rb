class ApplicationController < ActionController::Base
  before_action :authenticate_any!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  #サインイン後の遷移先の指定
  def after_sign_in_path_for(resource)
    questions_path
  end

  #サインアウト後の遷移先の指定
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


  #会員と管理者側がログインしているかを判断するためのメソッド
  def authenticate_any!
    if admin_signed_in?
        true
    else
        authenticate_user!
    end
  end
end
