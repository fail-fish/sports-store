source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'

gem 'rails', '~> 5.2.4', '>= 5.2.4.3'

gem 'active_storage_validations'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'figaro'
gem 'gon', '~> 6.2.0'
gem 'puma', '~> 3.11'

gem 'hiredis'
gem 'redis', '~> 3.0.1'

gem 'any_login'
gem 'devise'

gem 'braintree', '~> 2.33.1'

gem 'bootstrap'
gem 'font-awesome-sass', '~> 5.13.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'

gem 'factory_bot_rails'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'

gem 'rubocop-rails', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 4.0.1'
  gem 'sqlite3'
end

group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'mock_redis'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'simplecov', require: false
end

group :production do
  gem 'pg', '~> 0.18.4'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
