class Admin::AlbumsController < ApplicationController
  before_filter :admin_required
  
  def index
    @albums = Album.find(:all, :order => "created_at DESC")

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @albums }
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.attributes = params[:album]
    
    managing_photos

    respond_to do |format|
      if @album.save!
        flash[:notice] = 'Альбом изменён.'
        format.html { redirect_to admin_sections_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @album = Album.new(:section_id => params[:section_id])
  end

  def create
    @album = Album.new(params[:album])
    managing_photos

    respond_to do |format|
      if (@album.save)
        flash[:notice] = 'Альбом добавлен.'
        format.html { redirect_to admin_sections_path }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    respond_to do |format|
      format.html { redirect_to(admin_sections_path) }
      format.xml  { head :ok }
    end
  end

  def managing_photos
    params[:photos] ||= []
    params[:photos].each do |photo|
      @album.photos.build(photo) unless photo[:photo] == ""
    end

    params[:existing_photos] ||= []
    params[:existing_photos].each_value do |photo|
      @photo = Photo.find(photo[:id])
      @photo.update_attributes(photo)
    end unless params[:existing_photos].empty?
  end

end
