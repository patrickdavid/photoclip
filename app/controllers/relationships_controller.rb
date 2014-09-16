class RelationshipsController < ApplicationController
  before_filter :authorize

  def index
    @relationships = Relationship.all
  end

  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = Relationship.new
    @relationship.followed_by = current_user.id
    if @relationship.save
      redirect_to 'index', notice: "Your Relationship has been saved"
    else
      render 'new'
    end
  end

  def show
    @relationship = Relationship.find(params[:id])
  end

  def edit
    @relationship = Relationship.find(params[:id])
  end

  def update
    @relationship = Relationship.find(relationship_params)
    if @relationship.save
      redirect_to relationship_path(@relationship), notice: "Your Relationship has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    flash[:notice] = "The relationship has been deleted."
    redirect_to relationships_path
  end

private
  def relationship_params
    params.require(:relationship).permit(:followed_by, :following)
  end
end
