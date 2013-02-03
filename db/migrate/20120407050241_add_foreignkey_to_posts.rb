class AddForeignkeyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer ,:reference => {:users => :id}
  end
  
end
