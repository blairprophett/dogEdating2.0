class RemoveNeighborhoodFromParks < ActiveRecord::Migration
  def change
    remove_column :parks, :neighborhood, :string
  end
end
