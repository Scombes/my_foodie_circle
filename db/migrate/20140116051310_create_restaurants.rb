class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal
      t.string :phone
      t.string :category
      t.integer :user_id

      t.timestamps
    end
    add_index :restaurants, [:user_id, :created_at]
  end
end
