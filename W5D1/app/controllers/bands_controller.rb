class BandsController < ApplicationController

  def index
    @bands = Band.all

    render :index
  end

  def new
    @band = Band.new

    render :new
  end

  def create
    @band = Band.new(name: name)
    if @band.nil?
      render :new
    else
      @band.save!
      redirect_to band_url
    end
  end

  def show
    @band = Band.find(params[:id])

    render :show
  end

  def edit
    @band = Band.find(params[:id])

    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to bands_url
    else
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    if @band
      @band.delete
      redirect_to bands_url
    else
      render :index
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
