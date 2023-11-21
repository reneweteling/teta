require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Teta
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # allow all hosts
    config.hosts.clear

    config.action_mailer.delivery_method                      = :smtp
    config.action_mailer.smtp_settings                        = {}
    config.action_mailer.smtp_settings[:address]              = ENV['SMTP_ADDRESS']               if ENV['SMTP_ADDRESS'].present?
    config.action_mailer.smtp_settings[:port]                 = ENV['SMTP_PORT']                  if ENV['SMTP_PORT'].present?
    config.action_mailer.smtp_settings[:domain]               = ENV['SMTP_DOMAIN']                if ENV['SMTP_DOMAIN'].present?
    config.action_mailer.smtp_settings[:user_name]            = ENV['SMTP_USER']                  if ENV['SMTP_USER'].present?
    config.action_mailer.smtp_settings[:password]             = ENV['SMTP_PASS']                  if ENV['SMTP_PASS'].present?
    config.action_mailer.smtp_settings[:authentication]       = ENV['SMTP_AUTH']                  if ENV['SMTP_AUTH'].present?
    config.action_mailer.smtp_settings[:openssl_verify_mode]  = ENV['SMTP_OPENSSL_VERIFY_MODE']   if ENV['SMTP_OPENSSL_VERIFY_MODE'].present?
    config.action_mailer.smtp_settings[:enable_starttls_auto] = !!ENV['SMTP_STARTTLS']

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

# dokku config:set weteling SMTP_ADDRESS=smtp.gmail.com SMTP_AUTH=plain SMTP_DOMAIN=gmail.com SMTP_USER=thecladekker@gmail.com SMTP_PASS=asdfadsfasdf SMTP_PORT=587 SMTP_STARTTLS=true
