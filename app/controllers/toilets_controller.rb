class ToiletsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = " \
        toilets.title @@ :query \
        OR movies.description @@ :query \
        OR directors.first_name @@ :query \
        OR directors.last_name @@ :query \
      "
      @movies = Toilet.where(sql_query, query: "%#{params[:query]}%")
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
