class FlatsController < ApplicationController
  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
      
    redirect_to root_path
  end

  def flat_params
    params.require(:flat).permit(:name, :address)
  end
end
