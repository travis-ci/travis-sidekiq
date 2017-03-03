require 'sidekiq/web'
require 'travis'

if ENV['RACK_ENV'] != 'development'
  require 'rack/ssl'
  require 'travis/sso'
  Sidekiq::Web.session_secret = Travis.config.session_secret
  Sidekiq::Web.use Rack::SSL
  Sidekiq::Web.use Travis::SSO,
      endpoint:     Travis.config.api_endpoint,
      mode:         :session,
      authorized?:  -> u { Travis.config.admins.include? u['login'] }
  Sidekiq::Web.use Rack::Protection, use: :authenticity_token
end

Travis::Async::Sidekiq.setup(Travis.config.redis.url, Travis.config.sidekiq)
run Sidekiq::Web
