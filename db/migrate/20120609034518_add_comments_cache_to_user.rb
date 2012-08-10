class AddCommentsCacheToUser < ActiveRecord::Migration
  def change
    add_column :users , :comments_count , :integer , :default => 0
    
    User.reset_column_information
    User.find(:all).each do |u|
      User.update_counters u.id , :comments_count => u.comments.length
    end
    
  end
end
