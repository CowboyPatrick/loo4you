class ToiletsController < ApplicationController

  def index
   @toilets = Toilet.all
 end

  def show
    @toilet = Toilet.find(params[:id])
    authorize @toilet
  end
end
