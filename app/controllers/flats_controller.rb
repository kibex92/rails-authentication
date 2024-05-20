class FlatsController < ApplicationController
  def new
    @flat = Flat.new
  end

  def create
    @flat = current_user.flats.new(flat_params)

    if @flat.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render :new, status: :not_found
  end

  def flat_params
    params.require(:flat).permit(:name, :address)
  end
end
