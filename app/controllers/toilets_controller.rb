class ToiletsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]

  def index
    if params[:query].present?
      sql_query = " \
        toilets.title ILIKE :query \
        OR toilets.description ILIKE :query \
        OR toilets.address ILIKE :query \
      "
      @toilets = policy_scope(Toilet.where(sql_query, query: "%#{params[:query]}%")).geocoded
    else
      @toilets = policy_scope(Toilet).geocoded
    end

    @markers = @toilets.map do |toilet|
      {
        lat: toilet.latitude,
        lng: toilet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { toilet: toilet })
      }
    end
  end

  def show
    if params[:lat].present?
      @toilet = Toilet.near([params[:lat], params[:lon]])[0]
    else
      @toilet = Toilet.find(params[:id])
    end
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
