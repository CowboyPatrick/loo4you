class ToiletsController < ApplicationController

  def index
    @toilets = policy_scope(Toilet)
  end

  def show
    @toilet = Toilet.find(params[:id])
    authorize @toilet
  end
end
