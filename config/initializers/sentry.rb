Sentry.init do |config|
  config.dsn = 'https://09a11bb26df848d59e1eb6541483670e@glitchtip.weteling.com/3'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
end
