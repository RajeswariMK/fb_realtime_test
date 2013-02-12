class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def digest(str, key = ENV['FACEBOOK_SECRET'])
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha1'), key, str)
  end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
