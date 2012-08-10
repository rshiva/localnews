class Location < ActiveRecord::Base
  acts_as_gmappable :validation => true,:lat => "latitude", :lng => "longitude",:check_process => false #updates la and lon according to address 
  validates_presence_of :address, :on => :create, :message => "can't be blank"
  validates_presence_of :latitude, :on => :create, :message => "can't be blank"
  validates_presence_of :longitude, :on => :create, :message => "can't be blank"
  
  belongs_to :post


  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    address
  end
end
