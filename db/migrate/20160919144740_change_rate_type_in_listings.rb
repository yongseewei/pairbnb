class ChangeRateTypeInListings < ActiveRecord::Migration
  def change
  	change_column :listings, :rate, :integer
  end
end
