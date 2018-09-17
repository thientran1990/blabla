class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.integer :city_id, null: false
      t.string :ja_name, null: false, length: 10
      t.string :en_name, null: false, length: 20
      t.string :vn_name, null: false, length: 20
      t.integer :position, null: false, default: 1

      t.timestamps
    end

    add_index :districts, :city_id
    add_index :districts, :position
  end
end
