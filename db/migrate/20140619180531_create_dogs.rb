class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :age
      t.string :image
      t.references :user, index: true
      t.references :park, index: true

      t.timestamps
    end
  end
end
