class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title , :length_within => 5..80 , :not_blank => true
      t.text :content , :length_within => 5..500 , :not_blank => true
      t.timestamps
    end  
  end
end
