class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_sidebar_tags
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_sidebar_tags
    @sidebar_tags = ActsAsTaggableOn::Tag.most_used(35).order("name ASC")
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
