require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mainichispa
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.helper false
      g.stylesheet_engine :sass
      g.template_engine :slim
      g.test_framework :rspec, controller_specs: false, view_specs: false, helper_specs: false, request_specs: false
      g.factory_bot dir: 'spec/support/factories/'
    end
  end
end