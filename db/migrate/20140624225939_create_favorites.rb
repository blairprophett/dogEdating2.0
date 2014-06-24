class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :dog, index: true
      t.references :park, index: true
      t.timestamps
    end
  end
end
