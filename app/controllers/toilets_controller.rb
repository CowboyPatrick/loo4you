class ToiletsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
  end

  def show
    @toilet = Toilet.find(params[:id])
    @booking = Booking.new
    authorize @toilet
  end

  def toilet_params
    params.require(:toilet).permit(:title, :description, :category, :price, :address, :photo)
  end
end
