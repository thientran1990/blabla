class Admin::PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  def index
    @place = Place.all
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to admin_place_path(@place), notice: 'Place was successfully created.' }
        format.json { render action: 'show', status: :created, location: @place }
      else
        format.html { render action: 'new' }
        # format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { render action: 'show', notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_image
    @place = Place.find_by(id: params[:place_id])
    if @place.update_column :image_id, params[:image_id]
      render action: 'show', status: :created, location: @place
    end
  end

  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to admin_path }
      format.json { head :no_content }
    end
  end

  private
    def set_place
      @place = Place.where(slug: params[:id]).first
    end

    def place_params
      params.require(:place).permit(:ja_name, :ja_kana, :en_name,
        :category_id, :copy, :description, :city_id, :district_id,
        :vi_address, :ja_address, :en_address, :latitude, :longitude,
        :area_id, :keywords, :tel, :url, :access, :budget, :budget_lunch,
        :budget_dinner, :seats, :booking, :smoking, :open_at, :close_at, :holiday,
        :holiday_memo, :views, :views_in_week, :views_in_month, :prior, :published,
        :memo, :credit_cards, :shop_hour, :special_name, :score_bias, :email, :payment_for_reservation)
    end
end
