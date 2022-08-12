source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "3.1.2"

gem "active_storage_validations", "~> 0.9.5"
gem "bcrypt", "~> 3.1", ">= 3.1.12"
gem "bootsnap", ">= 1.4.4", require: false
gem "bootstrap-sass", "3.4.1"
gem "config", "~> 4.0"
gem "faker", "~> 2.1", ">= 2.1.2"
gem "figaro", "~> 1.1", ">= 1.1.1"
gem "htmlbeautifier", "~> 1.3", ">= 1.3.1"
gem "i18n-js", "~> 3.8", ">= 3.8.1"
gem "image_processing", "1.12.2"
gem "jbuilder", "~> 2.7"
gem "mini_magick", "4.9.5"
gem "mysql2", "~> 0.5.3"
gem "net-smtp", "~> 0.2.1"
gem "pagy", "~> 5.10", ">= 5.10.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.5", ">= 6.1.5.1"
gem "rails-i18n", "~> 6.0"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"
group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver", ">= 4.0.0.rc1"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "rubocop", "~> 1.26", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.14.0", require: false
end
