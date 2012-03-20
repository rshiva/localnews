class Post < ActiveRecord::Base
  
  
  validates :title,:content,:presence => true
  
  has_attached_file :news_photo, :styles => { :medium => "300x300>", :thumb => "70x52>" }
  
  
  validates_attachment_size :news_photo, :less_than => 5.megabytes
  validates_attachment_content_type :news_photo, :content_type => ['image/jpeg', 'image/png','image/jpg']
end
