class AddAddressToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :address, :text,:not_blank => true
  end
end
