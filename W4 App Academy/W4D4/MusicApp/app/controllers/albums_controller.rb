class AlbumsController < ApplicationController 

  before_action :ensure_logged_in

  def index
    @albums = Album.all 
    render :index 
  end 

  def show 
    @album = Album.find_by(id: params[:id])
    if @album 
      render :show 
    else 
      flash.now[:errors] = ["No such album exists!"]
      render :index 
    end 
  end 

  def new 
    @album = Album.new 
    @bands = Band.all
    render :new 
  end 

  def edit 
    @album = Album.find_by(id: params[:id])
    render :edit 
  end 

  def update
    @album = Album.find_by(id: params[:id])
    @band = @album.band
    @bands = Band.all
    if @album 
      @album.update!(params)
      render :show 
    else 
      flash.now[:errors] = ["No such album exists!"]
      redirect_to albums_url
    end 
  end 

  def create 
    @album = Album.new(album_params)
    # debugger
    @bands = Band.all
    if @album.save 
      redirect_to band_url(@album.band)
    else 
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end 
  end 

  def destroy 
    @album = Album.find_by(id: params[:id])
    if @album 
      @album.destroy 
      redirect_to band_url(@album.band.id)
    else 
      flash.now[:errors] = ["Invalid params!"]
      redirect_to bands_url
    end 
  end 

  private 
  def album_params 
    params.require(:album).permit(:year, :title, :live, :band_id)
  end 
end 