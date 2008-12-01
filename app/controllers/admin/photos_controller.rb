class Admin::PhotosController < ApplicationController
  before_filter :admin_required
  
  def index
    @photos = Photo.find(:all, :order => "created_at DESC")

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @photos }
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.attributes = params[:photo]
    

    respond_to do |format|
      if @photo.save!
        flash[:notice] = 'Альбом изменён.'
        format.html { redirect_to admin_sections_path }
        format.xml  { head :ok }
      #else
        #format.html { render :action => "edit" }
        #format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @photo = Photo.new()
  end

  def create
    @photo = Photo.new(params[:photo])
   

    respond_to do |format|
      if (@photo.save)
        flash[:notice] = 'Альбом добавлен.'
        format.html { redirect_to admin_photos_path }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to(admin_photos_path) }
      format.xml  { head :ok }
    end
  end

end
