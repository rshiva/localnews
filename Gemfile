source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'pg'
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem "haml-rails"
gem "client_side_validations"



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end



gem 'jquery-rails'
gem 'Empact-sexy_pg_constraints', :require => 'sexy_pg_constraints'
gem 'foreigner'

# To use ActiveModel has_secure_password
 gem 'bcrypt-ruby', '~> 3.0.0',:require => "bcrypt"


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "rspec-rails", :group => [:test, :development]
group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
end
