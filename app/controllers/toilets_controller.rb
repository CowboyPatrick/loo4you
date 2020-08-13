class ToiletsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @toilets = policy_scope(Toilet).geocoded

    @markers = @toilets.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @toilet = Toilet.find(params[:id])
    @booking = Booking.new
    authorize @toilet
  end

end
