class AddYelpIdToParks < ActiveRecord::Migration
  def change
    add_column :parks, :yelp_id, :string
  end
end
