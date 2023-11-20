# frozen_string_literal: true

# AlchemyCMS Dragonfly configuration.
#
# Consider using some kind of caching solution for image processing.
# For small projects, we have good experience with Rack::Cache.
#
# Larger installations should consider using a CDN, start reading
# http://markevans.github.io/dragonfly/cache/
#
# A complete reference can be found at
# http://markevans.github.io/dragonfly/configuration
#
# Pictures
#
require 'dragonfly/s3_data_store'

aws_config = {
  bucket_name: 'teta.weteling.com',
  access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
  secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
  region: 'eu-west-1',
  root_path: 'alchemy/pictures',
  url_host: 's3.eu-west-1.amazonaws.com/teta.weteling.com'
}

Dragonfly.app(:alchemy_pictures).configure do
  dragonfly_url nil
  plugin :imagemagick
  plugin :svg
  secret Rails.application.credentials.secret_key_base
  url_format '/pictures/:job/:basename.:ext'

  datastore :s3, aws_config
end

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware, :alchemy_pictures

# Attachments
Dragonfly.app(:alchemy_attachments).configure do
  datastore :s3, aws_config
end
