class Comment < ActiveRecord::Base
  belongs_to :user , :counter_cache => true
  belongs_to :post
end
