require_relative "boot"

require "rails/all"
require "./lib/denormalizers/router.rb"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CqrsProject
  class Application < Rails::Application
    config.to_prepare do
      event_store = Rails.configuration.event_store = RailsEventStore::Client.new
      event_store.subscribe_to_all_events(Router.new)
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
