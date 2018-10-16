class AddColumnEmailInPlace < ActiveRecord::Migration[5.0]
  def change
  	add_column :places, :email, :string
  end
end
