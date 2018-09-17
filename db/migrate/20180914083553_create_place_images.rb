class CreatePlaceImages < ActiveRecord::Migration[5.0]
  def change
    create_table :place_images do |t|
      t.string   :place_id
      t.integer  :image_size
      t.string   :image_uid
      t.timestamps
    end
  end
end
