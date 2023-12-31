# frozen_string_literal: true

source 'https://rubygems.org'
ruby '3.1.4'

gem 'psych', '< 4'

gem 'rails', '~> 6.1.7'
gem 'rails-i18n', '~> 6.0.0'

# Front end
gem 'coffee-rails'
gem 'react-rails'
gem 'turbolinks'
gem 'webpacker'
# Front end (needed only because of pghero and graphiql)
gem 'jquery-rails'
gem 'sass-rails'

# File management
gem 'aws-sdk-s3', require: false
gem 'image_processing'

# Database related
gem 'paper_trail'
gem 'pg'
gem 'pghero'
gem 'pg_search'
gem 'ransack'

# Account management
gem 'cancancan'
gem 'devise'
gem 'devise-i18n'
gem 'rolify'

# better timezone info
gem 'tzinfo'
gem 'tzinfo-data'

# Json generation
gem 'jbuilder'
gem 'oj'

# Security
gem 'rack-attack'

# Excel handling
# gem 'caxlsx' # export
# gem 'caxlsx_rails' # export
# gem 'roo', '1.13.2' # import

# PDF Generation
# gem 'wicked_pdf'
# gem 'wkhtmltopdf-binary', group: 'production'
# In order to generate PDFs locally, see dockerfile instructions

gem 'puma'

# Development produtivity
gem 'active_link_to'
gem 'bootsnap'
gem 'cocoon'
gem 'figaro'
gem 'formtastic'
# gem 'money-rails'
gem 'rubocop', require: false
gem 'sentry-raven'
gem 'will_paginate'

# Background jobs
gem 'sidekiq'
gem 'sidekiq-cron'

group :development do
  gem 'annotate'
  gem 'debug', '>= 1.0.0'
  gem 'derailed_benchmarks'
  gem 'foreman'
  gem 'web-console'
end

group :development, :test do
  # Terminal Debugging
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'

  # tests
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'listen', '~> 3.0.5'
  gem 'rspec-rails', '~> 3.8'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
