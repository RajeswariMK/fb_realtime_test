OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FB.app_id, FB.secrete
end

module FB
	def self.app_id
'479510062109507'
end
def self.secrete
	'239049adeb477f2bd4c46d344cd1033b'
end
end