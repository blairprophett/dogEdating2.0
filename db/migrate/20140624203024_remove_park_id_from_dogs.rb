class RemoveParkIdFromDogs < ActiveRecord::Migration
  def change
    remove_column :dogs, :park_id, :integer
  end
end
