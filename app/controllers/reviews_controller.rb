class ReviewsController < ApplicationController
    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
    end

    def create
        # create a review
        @review = Review.new(review_params)
        # find a restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
        # connect review and restaurant
        @review.restaurant = @restaurant
        if @review.save 
            redirect_to @restaurant
        else
            render 'restaurants/show'
        end
    end

    def destroy
        @review = review.find(params[:id])
        @review.destroy
        redirect_to @review.restaurant
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content)
    end
end
