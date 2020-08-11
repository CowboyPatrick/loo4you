class ToiletsController < ApplicationController

  def show
    @toilet = Toilet.find(params[:id])
    authorize @toilet
  end
end
