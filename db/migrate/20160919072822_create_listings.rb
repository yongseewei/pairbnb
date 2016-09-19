class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.float :rate
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :listings, :user_id
  end
end
