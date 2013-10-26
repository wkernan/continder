source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.14'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'devise'
gem 'simple_form'
gem 'newrelic_rpm'
gem 'will_paginate', '~> 3.0'

group :production do
	gem 'pg'
	gem 'rails_12factor', '0.0.2'
end 

group :development, :test do
	gem 'sqlite3'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'activerecord-reputation-system', require: 'reputation_system'