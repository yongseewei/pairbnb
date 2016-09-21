class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :listing_id
      t.daterange :duration
      t.integer :guest

      t.timestamps null: false
    end
  end
end
