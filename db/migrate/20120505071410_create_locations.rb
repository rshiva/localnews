class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.integer :post_id,:not_blank => true, :reference => {:posts => :id}

      t.timestamps
    end
    
    add_foreign_key(:locations,:posts)
  end
end
