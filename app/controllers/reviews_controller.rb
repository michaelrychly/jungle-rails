class ReviewsController < ApplicationController
  before_action :authorize

  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    review.product_id = params[:product_id]
    review.user_id = current_user.id
    #Attempt to save
    #If successful: redirect to appropriate page
    if review.save
      redirect_to product_path(params[:product_id])
    #Else: render the page where the form resides
    else
      redirect_to product_path(params[:product_id])
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to product_path(params[:product_id])
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
