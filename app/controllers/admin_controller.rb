class AdminController < ApplicationController
	layout 'admin'
  def index
  	@places = Place.all
    render template: 'admin/index'
  end
end
