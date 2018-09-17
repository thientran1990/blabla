class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :ja_name, null: false, length: 10
      t.string :en_name, null: false, length: 20
      t.integer :position, null: false, default: 1

      t.timestamps
    end

    add_index :categories, :position
  end
end
