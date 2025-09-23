source 'https://rubygems.org'

ruby '3.2.4'

group :travis do
  gem 'travis-config',   git: 'https://github.com/travis-ci/travis-config'
  gem 'travis-sso',      git: 'https://github.com/travis-ci/travis-sso.git'
end

group :rack do
  gem 'rack-ssl'
  gem 'rack', '~> 2.0'
  gem 'thin'
end

group :sidekiq do
  gem 'sidekiq'
  gem 'sinatra'
  gem 'slim'
end
