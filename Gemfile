source 'https://rubygems.org'

ruby '2.3.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap-social-rails'
gem 'font-awesome-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 5.0', '>= 5.0.5'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem "clearance"
gem "figaro"
gem 'omniauth'
gem 'omniauth-facebook'
gem 'simple_form', '~> 3.3', '>= 3.3.1'
gem 'masonry-rails', '~> 0.2.4'
gem 'acts-as-taggable-on', '~> 4.0'

gem 'carrierwave', '>= 1.0.0.beta', '< 2.0'
gem 'mini_magick'
gem 'ransack'
gem "letter_opener", :group => :development
gem 'sidekiq', '~> 4.2', '>= 4.2.1'
gem 'braintree', '~> 2.33.1'
gem 'gon', '~> 5.1.2'
gem 'searchkick'
gem 'fog'
gem "rails_best_practices"
gem 'private_pub'
gem 'thin'
gem 'api-ai-ruby', '~> 1.2', '>= 1.2.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-puma'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'shoulda-callback-matchers'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
	gem 'rails_12factor'

	gem 'puma', '~> 3.6'
end

