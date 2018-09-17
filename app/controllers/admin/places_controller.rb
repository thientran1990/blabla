class Admin::PlacesController < ApplicationController
  layout 'admin'
  def index
    @place = Place.all
  end

  def new
    @place = Place.new
  end
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to new_admin_place_path(@place), notice: 'Place was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @place }
      else
        format.html { render action: 'new' }
        # format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def place_params
      params.require(:place).permit(:ja_name, :ja_kana, :en_name, :category_id, :copy, :description, :city_id, :district_id, :vi_address, :ja_address, :en_address, :latitude, :longitude, :area_id, :keywords, :tel, :url, :access, :budget, :budget_lunch, :budget_dinner, :seats, :booking, :smoking, :open_at, :close_at, :holiday, :holiday_memo, :views, :views_in_week, :views_in_month, :prior, :published, :memo, :credit_cards, :shop_hour, :special_name, :score_bias, :email, :payment_for_reservation)
    end
end
