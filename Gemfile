source 'https://rubygems.org'

ruby '2.4.1'

group :travis do
  gem 'travis-config',   git: 'https://github.com/travis-ci/travis-config'
  gem 'travis-sso',      git: 'https://github.com/travis-ci/travis-sso.git'
  gem 'travis-sidekiqs', git: 'https://github.com/travis-ci/travis-sidekiqs.git'
end

group :rack do
  gem 'rack-ssl'
  gem 'rack'
  gem 'thin'
end

group :sidekiq do
  gem 'sidekiq'
  gem 'redis-namespace'
  gem 'sinatra'
  gem 'slim'
end
