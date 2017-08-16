# Rails.application.configure do
#   # Settings specified here will take precedence over those in config/application.rb.

#   # The test environment is used exclusively to run your application's
#   # test suite. You never need to work with it otherwise. Remember that
#   # your test database is "scratch space" for the test suite and is wiped
#   # and recreated between test runs. Don't rely on the data there!
#   config.cache_classes = true

#   # Do not eager load code on boot. This avoids loading your whole application
#   # just for the purpose of running a single test. If you are using a tool that
#   # preloads Rails for running tests, you may have to set it to true.
#   config.eager_load = false

#   # Configure public file server for tests with Cache-Control for performance.
#   config.public_file_server.enabled = true
#   config.public_file_server.headers = {
#     'Cache-Control' => 'public, max-age=3600'
#   }

#   # Show full error reports and disable caching.
#   config.consider_all_requests_local       = true
#   config.action_controller.perform_caching = false

#   # Raise exceptions instead of rendering exception templates.
#   config.action_dispatch.show_exceptions = false

#   # Disable request forgery protection in test environment.
#   config.action_controller.allow_forgery_protection = false
#   config.action_mailer.perform_caching = false

#   # Tell Action Mailer not to deliver emails to the real world.
#   # The :test delivery method accumulates sent emails in the
#   # ActionMailer::Base.deliveries array.
#   config.action_mailer.delivery_method = :test

#   # Print deprecation notices to the stderr.
#   config.active_support.deprecation = :stderr

#   # Raises error for missing translations
#   # config.action_view.raise_on_missing_translations = true
# end

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # def compile_asset?(path)
  #     # ignores any filename that begins with '_' (e.g. sass partials)
  #     # all other css/js/sass/image files are processed
  #     if File.basename(path) =~ /^[^_].*\.\w+$/
  #       puts "Compiling: #{path}"
  #       true
  #     else
  #       puts "Ignoring: #{path}"
  #       false
  #     end
  # end

  # config.assets.precompile = [ method(:compile_asset?).to_proc ]

  # config.assets.precompile << /(^[^_\/]|\/[^_])[^\/]*$/

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

end