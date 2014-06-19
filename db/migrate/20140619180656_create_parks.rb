class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.string :neighborhood
      t.string :street_address
      t.text :city_state_zip
      t.text :img_url

      t.timestamps
    end
  end
end
