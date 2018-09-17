class CreateAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
      t.integer :city_id, null: false
      t.string :ja_name, null: false, length: 20
      t.string :en_name, null: false, length: 30
      t.integer :position, null: false, default: 1

      t.timestamps
    end

    add_index :areas, :city_id
    add_index :areas, :position
  end
end
