class PhotosController < ApplicationController

  before_action :set_list
  def index
    @photo = @list.photo.order('created_at')
  end

  def new
    @photo = @list.photo.new
  end

  def show
    @photo = @list.photo.find params[:id]
  end


  def create
    @photo = @list.photo.new(photo_params)
    @photo.list = @list
    if @photo.save
      flash[:success] = "The photo was added!"
      redirect_to @list
    else
      render 'new'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title)
  end

  private
  def set_list
    @list = List.find params[:list_id]
  end
end
