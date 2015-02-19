source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

#Database
gem 'pg'

# Front end
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'font-awesome-sass'

gem "active_model_serializers", "0.8.3"
gem "rack-cors", require: "rack/cors"

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'annotate', '~> 2.6.5'
  gem 'railroady'
  gem 'terminal-notifier-guard'
  gem 'guard-rspec', require: false
  gem 'fuubar'
end

group :test do
  gem 'webmock'
  gem 'database_cleaner', '1.3.0'
  gem 'codeclimate-test-reporter', require: nil
  gem 'shoulda-matchers'
  gem "json-schema"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails', '~> 3.1'
  gem 'pry'
  gem 'dotenv-rails'
  gem 'factory_girl_rails', '~> 4.5.0'
end
