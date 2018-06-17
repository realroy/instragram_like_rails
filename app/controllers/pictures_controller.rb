class PicturesController < ApplicationController

  before_action :find_picture, only: [:show, :edit, :update, :destroy, :like]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pictures = Picture.all.order 'created_at DESC'
  end

  def new
    @picture = current_user.pictures.build
  end

  def create
    @picture = current_user.pictures.build picture_params
    if @picture.save
      redirect_to @picture, notice: 'Picture was posted!'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update picture_params
      redirect_to @picture
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path
  end

  def like
    @like = @picture.likes.find_by user_id: current_user.id
    if @like == nil
      @like = @picture.likes.build
      @like.update user_id: current_user.id
      @like.save
      respond_to do |format|
        format.json {render json: { result: 1 }, status: :ok}
      end
    else
      @like.destroy
      respond_to do |format|
        format.json {render json: { result: -1 }, status: :ok}
      end
    end
  end

  private


  def picture_params
    params.require(:picture).permit :title, :description, :image
  end

  def find_picture
    @picture = Picture.find params[:id]
  end
end
