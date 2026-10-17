source "https://rubygems.org"

gem "rails", "~> 8.1.4"
gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "popper_js", "~> 2.11.8"
gem "sassc-rails"
gem "json", "~> 2.6"
gem "image_processing", "~>1.2"

gem "bootstrap", "~> 5.1.3"
gem "devise"
gem "mini_racer"
gem "bcrypt", "~> 3.1.7"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "bootsnap", require: false

gem "kamal", require: false

gem "thruster", require: false


group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  gem "brakeman", require: false

  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
end

gem "net-smtp"
