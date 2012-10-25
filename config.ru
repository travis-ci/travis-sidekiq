require 'sidekiq/web'
require 'travis'

Sidekiq::Web.configure :production do |config|
  require 'rack/ssl'
  require 'travis/sso'

  config.set session_secret: Travis.config.session_secret, sessions: true
  config.use Rack::SSL
  config.use Travis::SSO,
    endpoint:     Travis.config.api_endpoint,
    mode:         :session,
    authorized?:  -> u { Travis.config.admins.include? u['login'] }
end

Travis::Async::Sidekiq.setup(Travis.config.redis.url, Travis.config.sidekiq)
run Sidekiq::Web
