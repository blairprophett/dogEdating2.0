class AddCityAndStateAndZipToParks < ActiveRecord::Migration
  def change
    add_column :parks, :city, :string
    add_column :parks, :state, :string
    add_column :parks, :zip, :integer
  end
end
