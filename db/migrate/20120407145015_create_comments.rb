class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id,:not_blank => true, :reference => {:users => :id}
      t.integer :post_id,:not_blank => true, :reference => {:posts => :id}
      t.text :body

      t.timestamps
    end
    add_foreign_key(:comments,:posts)
    add_index(:comments,:user_id)
    add_index(:comments,:post_id)
    
    
  end
end
