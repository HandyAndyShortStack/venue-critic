class AddImageProcessedToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :image_processed, :boolean, default: false
  end
end
