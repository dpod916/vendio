source 'https://rubygems.org'

# ruby '2.3.1', :engine => 'jruby', :engine_version => '9.1.7.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
gem 'pg'

gem 'activerecord'
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'
gem 'acts_as_list'
gem 'opinions'

gem 'active_model_serializers'
gem 'money'
gem 'rails_email_preview'

gem 'best_in_place'
gem 'bootstrap-sass'

gem 'cancancan'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

gem 'dropzonejs-rails'

gem 'mailboxer'
gem 'troupe'


gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'searchkick'

# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-infinite-pages'
gem 'execjs'

gem 'redis'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

gem 'rails-jquery-tokeninput'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'maxminddb'
gem 'will_paginate'
gem 'whenever', :require => false
gem 'jquery-ui-rails'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

## User Authentication Gems
gem 'devise'
gem 'devise-two-factor'
gem "devise_ldap_authenticatable"

gem 'mail'
gem 'linguistics'
gem 'delayed_job'
# gem 'country_state_select'
gem 'geokit-rails'
gem 'secondbase'
gem 'google_places'

# gem 'railroad'

gem 'jqgrid_for_rails', '~> 1.0', '>= 1.0.2'
gem 'jquery-datatables-rails'

gem 'public_activity'
gem 'activity_notification'
gem 'rolify'

gem 'font-awesome-rails'
gem 'truncate_html'
#gem 'bootstrap_form'

gem 'verbs'
gem 'paperclip'

gem 'simple_form'

gem 'geonames'
gem 'closure_tree'
 
platform :jruby do
	gem 'activerecord-jdbc-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
	gem 'trinidad', :require => nil
	gem 'jdbc-sqlite3'
	gem 'activerecord-jdbcsqlite3-adapter', git: 'https://github.com/jruby/activerecord-jdbc-adapter.git', branch: 'rails-5'
end

group :development, :test do
  # # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', :require => nil, platform: :mri
  gem 'sqlite3', :require => nil, platform: :mri
  # gem 'populator'
  # gem 'faker'
  # gem 'betterlorem'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  # gem 'notesgrip', :require => nil
  gem 'htmlentities'
  gem 'ruby_dep'
  gem 'rails_refactor'
  gem 'listen'
  gem 'coffee-script-source', '1.8.0'
  gem "better_errors"
  gem 'rails_db', :require => nil
  # gem "simple-spreadsheet"
end

group :production do
	gem 'activerecord-jdbcpostgresql-adapter', platform: :jruby
	gem 'activerecord-oracle_enhanced-adapter', platform: :jruby
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
