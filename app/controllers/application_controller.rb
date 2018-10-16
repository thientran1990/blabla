class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_not_found
    return head :no_content if request.xhr?
    render template: 'errors/404.html', layout: 'layouts/application', status: :not_found
  end
end
