OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FB.APP_ID, FB.SECRETE
end

module FB
	APP_ID = '479510062109507'
	SECRETE = '239049adeb477f2bd4c46d344cd1033b'
end