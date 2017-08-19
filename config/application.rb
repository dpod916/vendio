require_relative 'boot'

require 'rails/all'
require 'will_paginate/array'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module Vendio
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.precompile += [ 'appviews.css', 'cssanimations.css', 'training_sessions.css','issues.css', 'dashboards.css', 'forms.css', 'gallery.css', 'graphs.css', 'mailbox.css', 'miscellaneous.css', 'pages.css', 'tables.css', 'uielements.css', 'widgets.css', 'commerce.css' ]
    config.assets.precompile += [ 'appviews.js', 'cssanimations.js', 'dashboards.js', 'forms.js', 'gallery.js', 'graphs.js', 'mailbox.js', 'miscellaneous.js', 'pages.js', 'tables.js', 'uielements.js', 'widgets.js', 'commerce.js' ]
  	WillPaginate.per_page = 10
  	config.autoload_paths += %W(#{config.root}/app/models/concerns)
  	config.autoload_paths += %W(#{config.root}/app/models/agreements)
  	config.autoload_paths += %W(#{config.root}/app/models/agreement_tasks)
    config.autoload_paths += %W(#{config.root}/app/models/trainings)
    config.autoload_paths += %W(#{config.root}/app/models/user_groups)
    config.autoload_paths << Rails.root.join('lib')
    config.web_console.whitelisted_ips = ['10.240.1.15', '10.240.1.19', '10.240.0.182']
  end
end
