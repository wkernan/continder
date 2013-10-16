# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Continder::Application.initialize!
require 'tlsmail'
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.delivery_method = :smtp
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
	address: "smtp.gmail.com",
	port: 587,
	domain: 'gmail.com',
	:authentication => :plain, 
	user_name: 'USERNAME',
	password: 'PASSWORD',
	enable_starttls_auto: true
}