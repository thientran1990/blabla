class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :ja_name, null: false, lenght: 50
      t.string :ja_kana, null: false, length: 50
      t.string :en_name, null: false, length: 50
      t.string :slug, null: false, length: 50
      t.integer :category_id, null: false
      t.text :description
      t.integer :city_id, null: false
      t.integer :district_id
      t.string :vi_address, length: 200
      t.string :ja_address, length: 200
      t.string :en_address, length: 200
      t.string :latitude, length: 20
      t.string :longitude, length: 20
      t.integer :area_id
      t.string :keywords, length: 100
      t.string :tel, length: 20
      t.string :url, length: 100
      t.string :access, length: 100
      t.string :seats
      t.string :booking
      t.string :smoking
      t.string :credit_cards
      t.string :shop_hour, length: 30
      t.string :holiday
      t.integer :views, null: false, default: 0
      t.integer :views_in_week, null: false, default: 0
      t.integer :views_in_month, null: false, default: 0

      t.integer :image_id, null: false, default: 0

      t.integer :prior, null: false, default: 0
      t.boolean :published, null: false, default: false

      t.timestamps
    end

    add_index :places, :ja_name
    add_index :places, :ja_kana
    add_index :places, :en_name
    add_index :places, :category_id
    add_index :places, :city_id
    add_index :places, :district_id
    add_index :places, :vi_address
    add_index :places, :en_address
    add_index :places, :ja_address
    add_index :places, :latitude
    add_index :places, :longitude
    add_index :places, :area_id
    add_index :places, :keywords
    add_index :places, :views
    add_index :places, :views_in_week
    add_index :places, :views_in_month
    add_index :places, :prior
  end
end
