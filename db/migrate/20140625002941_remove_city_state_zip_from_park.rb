class RemoveCityStateZipFromPark < ActiveRecord::Migration
  def change
    remove_column :parks, :city_state_zip, :text
  end
end
