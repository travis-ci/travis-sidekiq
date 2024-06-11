source 'https://rubygems.org'

ruby '3.2.4'

group :travis do
  gem 'travis-config',   git: 'https://github.com/travis-ci/travis-config'
  gem 'travis-sso',      git: 'https://github.com/travis-ci/travis-sso.git'
end

group :rack do
  gem 'rack-ssl'
  gem 'rack'
  gem 'thin' , '~> 1.8'
end

group :sidekiq do
  gem 'sidekiq'
  gem 'sinatra', '~> 2'
  gem 'slim'
end
