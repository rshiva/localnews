class LocationsController < ApplicationController
  def index
    @locations=Location.all
    @json = Location.all.to_gmaps4rails
    respond_to do |format|
      format.html
      format.xml {render :xml => @locations}
    end
  end
  
  def new
    @location=Location.new
    respond_to do |format|
      format.html
      format.xml {render :xml => @location}
    end
  end
  
  def create
    @location=Location.new(params[:location])
    respond_to do |format|
       if @location.save
          format.html { redirect_to @location, notice: 'Post was successfully created.' }
        else
          format.html { render action: "new" }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
    end
  end
  
  def edit
    @location=Location.find(params[:id])
  end
  
  def show
    @location=Location.find(params[:id])
    @json = @location.to_gmaps4rails
  end
  
end
