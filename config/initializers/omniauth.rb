OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '158506181011684', 'f6a508043410d248b962e2cb424a860c',
  {:scope => 'PERMISSION_1, PERMISSION_2, PERMISSION_3...', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
end