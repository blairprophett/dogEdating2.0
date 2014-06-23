class AddAddressToParks < ActiveRecord::Migration
  def change
    add_column :parks, :address, :text
  end
end
