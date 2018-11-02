source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 4.1.3'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem "figaro"
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mini_magick'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.7'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'stripe'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'

# gem 'therubyracer', platforms: :ruby
# gem 'redis', '~> 3.0'
# gem 'rmagick'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
