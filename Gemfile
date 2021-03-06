source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'sorcery'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bootsnap', '>= 1.1.0', require: false

# Bootstrap4
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'

# font-awesome
gem 'font-awesome-sass', '~> 5.4.1'

# slim
gem 'html2slim'
gem 'slim'
gem 'slim-rails'

# i18n
gem 'rails-i18n', '~> 5.1'

gem 'config'

# decorater
gem 'draper'

# scraping
gem 'nokogiri'

# 形態素解析
# gem 'mecab' , '0.996'
# gem 'natto'
# gem 'sanitize'

# pagenation
gem 'kaminari'

# search
gem 'ransack'

# Background Job
gem 'whenever', require: false

group :development, :test do
  # mysql
  gem 'mysql2', '>= 0.4.4', '< 0.6.0'
  # デバッガー
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'better_errors'
  gem 'binding_of_caller'
  # コード解析
  gem 'rails_best_practices'
  gem 'rubocop-rails'
  #Rspec
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'webdrivers'
  gem 'capybara'
  gem 'letter_opener_web', '~> 1.0'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
