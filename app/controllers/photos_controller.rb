class PhotosController < ApplicationController
  before_filter :authorize

  def index
    @photos = Photo.all
  end

  def new
    @photo = current_user.photos.new
  end

  def create
    @user = current_user
    @photo = Photo.new(photo_params)
    current_user.photos << @photo
    if @photo.save
      redirect_to photos_path, notice: "Your Photo has been saved"
    else
      render 'new'
    end
  end

  def show
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
    params.require(:photo).permit(:caption, :user_id, :photo)
  end
end
