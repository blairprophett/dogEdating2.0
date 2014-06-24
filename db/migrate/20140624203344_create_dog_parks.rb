class CreateDogParks < ActiveRecord::Migration
  def change
    create_table :dog_parks do |t|
      t.references :dog, index: true
      t.references :park, index: true

      t.timestamps
    end
  end
end
