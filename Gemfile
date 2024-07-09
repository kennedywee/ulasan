source "https://rubygems.org"

ruby file: ".ruby-version"

gem "rails", "~> 7.1.3", ">= 7.1.3.3"

# Drivers
gem "pg", "~> 1.1"
gem "redis", ">= 4.0.1"

# Deployment
gem "puma", ">= 5.0"

# Frontend
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"

# Others
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false
gem "image_processing", "~> 1.2"
gem "devise"
gem "lucide-rails", "~> 0.4.0"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "faker", require: false
  gem "brakeman", require: false
  gem "solargraph", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
  gem "letter_opener"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
