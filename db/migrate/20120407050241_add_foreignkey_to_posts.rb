class AddForeignkeyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer ,:reference => {:users => :id}
    add_foreign_key(:posts,:users)
  end
  
end
