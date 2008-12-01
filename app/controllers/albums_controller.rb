class AlbumsController < ApplicationController
  def index
    @albums = Album.find(:all)
  end

  def show
    @album = Album.find_by_ident_name(params[:id]) || Album.find(params[:id])
  end

end
