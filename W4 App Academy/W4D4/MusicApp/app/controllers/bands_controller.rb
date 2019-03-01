class BandsController < ApplicationController 

  before_action :ensure_logged_in

  def index
    @bands = Band.all 
    render :index 
  end 

  def show 
    @band = Band.find_by(id: params[:id])
    if @band 
      render :show 
    else 
      flash.now[:errors] = ["No such band exists!"]
      render :index 
    end 
  end 

  def new 
    @band = Band.new 
    render :new 
  end 

  def edit 
    @band = Band.find_by(id: params[:id])
    render :edit 
  end 

  def update
    @band = Band.find_by(id: params[:id])
    if @band 
      @band.update!(params)
      render :show 
    else 
      flash.now[:errors] = ["No such band exists!"]
      redirect_to bands_url
    end 
  end 

  def create 
    @band = Band.new(band_params)

    if @band.save 
      redirect_to bands_url
    else 
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end 
  end 

  # def destroy 
  #   @band = Band.find_by(params[:id])
  #   if @band 
  #     @band.destroy 
  #   else 
  #     flash.now[:errors] = ["Invalid params!"]
  #     redirect_to bands_url
  #   end 
  # end 

  private 
  def band_params 
    params.require(:band).permit(:name)
  end 
end 