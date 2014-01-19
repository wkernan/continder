source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'devise', '~> 3.0.0.rc'
gem 'simple_form'
gem 'newrelic_rpm'
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap'

group :production do
	gem 'pg'
	gem 'rails_12factor', '0.0.2'
end 

group :development, :test do
	gem 'sqlite3'
end

group :assets do
  gem 'sass-rails',   '~> 4.0.1'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier'
end

gem 'activerecord-reputation-system', require: 'reputation_system'