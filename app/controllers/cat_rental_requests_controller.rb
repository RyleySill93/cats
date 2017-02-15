class CatRentalRequestsController < ApplicationController
  def index
  end

  def new
    @cats = Cat.all
    render :new
  end

  def create
    @rental = CatRentalRequest.new(cat_rental_params)

    if @rental.save
      @rental.status = "APPROVED"
      @rental.save
      redirect_to cat_url(@rental.cat)
    else
      render html: @rental.errors.full_messages, status: :unprocessable_entity
    end
  end

  def approve
    @rental = CatRentalRequest.find(params[:cat_id])
    @rental.approve!
    redirect_to cat_url(@rental.cat)
  end

  def deny
    @rental = CatRentalRequest.find(params[:cat_id])
    @rental.deny!
    redirect_to cat_url(@rental.cat)
  end

  private
  def cat_rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
