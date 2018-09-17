class Admin::PlaceImagesController < ApplicationController
  layout 'admin'
  def index
    # @place = Place.all
  end

  def new
    @image = PlaceImage.new
  end
  def create
    @image = PlaceImage.new(place_params)

    if @image.save
      flash[:success] = "Photo saved!"
    else
      render :new
    end
    # respond_to do |format|
    #   if @image.save
    #     # format.html { redirect_to new_admin_place_path(@place), notice: 'Place was successfully created.' }
    #     flash[:success] = "Photo saved!"
    #     # format.json { render action: 'show', status: :created, location: @place }
    #   else
    #     format.html { render action: 'new' }
    #     # format.json { render json: @place.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

    def place_params
      params.require(:images).permit(:image)
    end
end
