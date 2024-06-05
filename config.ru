require 'sidekiq'
require 'sidekiq/web'
require 'travis/config'

module Travis
  class Config < Hashr
    define  sidekiq: { pool_size: 1, id: nil },
            redis:   { url: 'redis://localhost:6379' }
  end

  def self.config
    @config ||= Travis::Config.load
  end
end


File.open('.session.key', 'w') { |f| f.write(Travis.config.session_secret) }

if ENV['RACK_ENV'] != 'development'
  require 'rack/ssl'
  require 'travis/sso'

  Sidekiq::Web.use Rack::SSL
  Sidekiq::Web.use Travis::SSO,
      endpoint:     Travis.config.api_endpoint,
      mode:         :session,
      authorized?:  -> u { Travis.config.admins.include? u['login'] }
end

use Rack::Session::Cookie, secret: File.read(".session.key"), same_site: true, max_age: 86400

Sidekiq.configure_client do |config|
  config.redis = Travis.config.redis.to_h.merge(size: 1, id: nil)
end

run Sidekiq::Web
