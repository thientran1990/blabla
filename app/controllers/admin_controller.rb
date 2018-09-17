class AdminController < ApplicationController
	layout 'admin'
  def index
    render template: 'admin/index'
  end
end
