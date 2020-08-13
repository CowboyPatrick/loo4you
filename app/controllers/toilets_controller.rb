class ToiletsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]

  def index
    @toilets = policy_scope(Toilet)
  end

  def show
    @toilet = Toilet.find(params[:id])
    @booking = Booking.new
    authorize @toilet
  end

  def new
    @toilet = Toilet.new
    authorize @toilet
  end

  def create
    @toilet = Toilet.new(toilet_params)
    if @toilet.save
      redirect_to toilet_path
    else
      render :new
    end
    authorize @toilet
  end

  private

  def toilet_params
    params.require(:toilet).permit(:title, :description, :category, :price, :address, :photo)
  end
end
