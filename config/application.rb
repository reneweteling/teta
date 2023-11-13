require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Teta
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # config.hosts << "www.energetischreinigen.local.gd:3000"
    # config.hosts << "energetischreinigen.local.gd:3000"
    # config.hosts << "www.energetischreinigen.com"
    # config.hosts << "energetischreinigen.com"

    # config.hosts << "www.thecladekker.local.gd:3000"
    # config.hosts << "thecladekker.local.gd:3000"
    # config.hosts << "www.thecladekker.nl"
    # config.hosts << "thecladekker.nl"
    #
    # allow all hosts
    config.hosts.clear

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
