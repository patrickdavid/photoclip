class TagsController < ApplicationController
  before_filter :authorize

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @user = User.find(params[:id])
    @photo = Photo.find(params[:id])
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to 'index', notice: "Your Tag has been saved"
    else
      render 'new'
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @photo = Photo.find(params[:id])
    @tag = Tag.find(tag_params)
    if @tag.save
      redirect_to tag_path(@tag), notice: "Your Tag has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "The tag has been deleted."
    redirect_to tags_path
  end

private
  def tag_params
    params.require(:tag).permit(:user_id, :photo_id)
  end
end
