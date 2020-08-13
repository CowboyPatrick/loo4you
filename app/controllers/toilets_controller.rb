class ToiletsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]

  def index
    if params[:query].present?
      sql_query = " \
        toilets.title ILIKE :query \
        OR toilets.description ILIKE :query \
        OR toilets.address ILIKE :query \
      "
      @toilets = policy_scope(Toilet.where(sql_query, query: "%#{params[:query]}%"))
    else
      @toilets = policy_scope(Toilet)
    end

    @markers = @toilets.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude
      }
    end
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
    @toilet.user = current_user
    if @toilet.save
      redirect_to toilets_path
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
