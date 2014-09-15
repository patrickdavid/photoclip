class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    if @photo.save
      redirect_to 'index', notice: "Your Photo has been saved"
    else
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(photo_params)
    if @photo.save
      redirect_to photo_path(@photo), notice: "Your Photo has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "The photo has been deleted."
    redirect_to photos_path
  end

private
  def photo_params
    params.require(:photo).permit(:caption)
  end
end
