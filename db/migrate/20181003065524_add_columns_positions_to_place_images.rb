class AddColumnsPositionsToPlaceImages < ActiveRecord::Migration[5.0]
  def change
  	add_column :place_images, :positions, :integer, null: false, default: 0
  end
end
