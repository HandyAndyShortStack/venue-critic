class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :venue_id
      t.integer :overall
      t.text :note
      t.text :dispute
      t.integer :soundequip
      t.integer :soundtech
      t.integer :compensation
      t.text :compdescr

      t.timestamps
    end
  end
end
