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
Dragonfly.app(:alchemy_pictures).configure do
  dragonfly_url nil
  plugin :imagemagick
  plugin :svg
  secret '8dd7f188700198aeed7deab258fa4af74d48cf03f1318bbf11705e0a7c796dfc'
  url_format '/pictures/:job/:basename.:ext'

  datastore :file,
            root_path: Rails.root.join('uploads/pictures').to_s,
            server_root: Rails.public_path,
            store_meta: false
end

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware, :alchemy_pictures

# Attachments
Dragonfly.app(:alchemy_attachments).configure do
  datastore :file,
            root_path: Rails.root.join('uploads/attachments').to_s,
            store_meta: false
end
