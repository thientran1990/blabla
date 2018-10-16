class Admin::PlaceImagesController < ApplicationController
  before_action :set_place
  layout 'admin'
  def index
    @images = @place.place_images.all
  end

  def create
    @image = @place.place_images.build(image: image_params[:file])
    if @image.save
      redirect_to admin_place_path(@place.slug), notice: 'コメント内容を更新しました'
    end
  end

  def destroy
    @image = PlaceImage.find_by(id: params[:id])
    @image.destroy
    redirect_to admin_place_path(@place), notice: 'コメント内容を更新しました'  
  end

  def change_image
    @place.update_column(@place.image_id, params[:image_id])
  end

  private

  def set_place
    @place = Place.find_by(id: params[:place_id])
    # render_not_found if @place.blank?

  end

  def image_params
    params.require(:place_image).permit(:file)
  end

  def object_params

  end
end
