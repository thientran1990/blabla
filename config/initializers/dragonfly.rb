require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "8f662c641271bf687c72b39d0e58b5b6f2d1e84ba1feff74ab0600b38f1f2600"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
