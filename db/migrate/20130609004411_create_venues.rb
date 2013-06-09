class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :neighborhood
      t.boolean :alcohol
      t.string :allages
      t.string :stagesize

      t.timestamps
    end
  end
end
