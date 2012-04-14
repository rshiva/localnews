class User < ActiveRecord::Base
    has_secure_password
    attr_accessible :email,:password,:password_confirmation
    
    validates_uniqueness_of :email ,:display_name
    validates_presence_of :password, :on => :create
    validates_format_of :display_name,:with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
    validates_length_of :password, :minimum => 8, :allow_blank => true
    #validates_presence_of :email , :display_name
    has_many :posts
    has_many :comments
end
