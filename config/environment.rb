# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Continder::Application.initialize!

#needed to get mailer to work
#APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")