# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version')

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'bootstrap', '~> 4.6'
gem 'devise', '~> 4.7'
gem 'font-awesome-rails', '~> 4.7'
gem 'haml', '~> 5.2'
gem 'jbuilder', '~> 2.7'
gem 'jquery-rails', '~> 4.4'
gem 'lazy_high_charts', '~> 1.6'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.1'
gem 'rails', '~> 6.1.1'
gem 'sass-rails', '>= 6'
gem 'sprockets', '~> 4.0'
gem 'sprockets-rails', '~> 3.2', require: 'sprockets/railtie'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.1'
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', '~> 1.9', require: false
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'sqlite3'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
