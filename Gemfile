source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'bcrypt'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'dry-validation', '0.11.1'
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
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry', '~> 0.13.1'
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
