# frozen_string_literal: true

require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Contest
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators do |g|
      g.hidden_namespaces << :test_unit << :erb # Hide unwanted generators
      g.assets false
      g.helper false
      g.view_specs false
      g.migration false
      g.skip_routes false
      g.template_engine nil
      g.orm :active_record
      g.jbuilder true
      g.test_framework :rspec, view_specs: false, fixture_replacement: :factory_bot
      g.integration_tool :rspec
      g.system_tests :rspec
      g.fixture_replacement :factory_girl # Choose between fixtures and factories
      g.factory_bot dir: "test/factories"
      g.scaffold_controller "responders_controller" # from responders gem
      g.skip true
      g.timestamps false
      g.api true
      g.fixture false
      g.factory_bot true
      g.colorize_logging
    end

    #config.autoload_paths << %W(Rails.root.join("lib") Rails.root.join("lib/helpers"))
    config.eager_load_paths += Dir["#{config.root}/lib/**/**/"]

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
