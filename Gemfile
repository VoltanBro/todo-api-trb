source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'bcrypt'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'dry-validation', '0.11.1'
gem 'ffaker'
gem 'jsonapi-serializer'
gem 'jwt_sessions'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'reform', '2.2.4'
gem 'reform-rails'
gem 'simple_endpoint', '~> 1.0.0'
gem 'trailblazer', '~> 2.1'

group :development, :test do
  gem 'brakeman'
  gem 'bullet'
  gem 'bundle-audit'
  gem 'bundler-leak', '~> 0.2.0'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_consistency'
  gem 'fasterer', '~> 0.8.3'
  gem 'lefthook', '~> 0.7.2'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot_rails'
  gem 'json_matchers'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'simplecov', require: false
end
