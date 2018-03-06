require 'sidekiq/web'
require 'travis/config'

config = Travis::Config.load

if ENV['RACK_ENV'] != 'development'
  require 'rack/ssl'
  require 'travis/sso'
  Sidekiq::Web.session_secret = config.session_secret
  Sidekiq::Web.use Rack::SSL
  Sidekiq::Web.use Travis::SSO,
      endpoint:     config.api_endpoint,
      mode:         :session,
      authorized?:  -> u { config.admins.include? u['login'] }
  Sidekiq::Web.use Rack::Protection, use: :authenticity_token
end

Travis::Async::Sidekiq.setup(config.redis.url, config.sidekiq)
run Sidekiq::Web
