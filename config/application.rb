require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module BooksApp
  class Application < Rails::Application
    I18n.available_locales = [:en, :ja]
    config.i18n.default_locale = :ja
    config.load_defaults 6.1
  end
end

