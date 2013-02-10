OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '141213822708267', 'f9b95f55474f790335c44f4be592ec26'
end