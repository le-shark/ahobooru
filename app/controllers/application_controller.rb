class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_sidebar_tags

  def set_sidebar_tags
    @sidebar_tags = ActsAsTaggableOn::Tag.most_used(35).order("name ASC")
  end
end
