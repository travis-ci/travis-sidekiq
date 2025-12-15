source 'https://rubygems.org'

ruby '3.2.9'

group :travis do
  gem 'travis-config',   git: 'https://github.com/travis-ci/travis-config'
  gem 'travis-sso',      git: 'https://github.com/travis-ci/travis-sso.git'
end

group :rack do
  gem 'rack-ssl'
  gem 'rack'
  gem 'thin' , '~> 1.8'
end


gem 'sidekiq-pro', require: 'sidekiq-pro', source: 'https://gems.contribsys.com'
gem 'sinatra', '~> 2'
gem 'slim'