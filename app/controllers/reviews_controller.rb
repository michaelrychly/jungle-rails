class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    #find the parent model
    puts "first in review #{params[:description]}"
    review = Review.new(review_params)
    puts "in review #{review.inspect}"
    raise "here"
#Use the has_many association to initialize the child instance

    # after @review has been initialized, but before calling .save on it:
    @review.user = current_user
    #Attempt to save
    #If successful: redirect to appropriate page
    if @review.save
      redirect :product
    #Else: render the page where the form resides
    else
      render :product
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
