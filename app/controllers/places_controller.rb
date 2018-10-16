class PlacesController < ApplicationController
  before_action :set_place

  def index
    # @place = Place.all
  end

  def show 
  # @place = Place.all


  end

  private

    def set_place
      @place = Place.where(slug: params[:id]).first
      # raise ActiveRecord::RecordNotFound if @place.blank?
      # render root_path if @place.blank?
    end
end
