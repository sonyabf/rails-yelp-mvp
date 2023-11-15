class RestaurantsController < ApplicationController

  before_action :set_params, only: [:show, :edit]

  def new
    @restaurant = Restaurant.new
  end

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  #   @restaurant.update(restaurant_params)
  #   redirect_to restaurant_path(@restaurant)
  # end

  def show
    @average_rating = calculate_average_rating(@restaurant)
  end

  private

  def calculate_average_rating(restaurant)
    if restaurant.reviews.present?
      total_ratings = restaurant.reviews.sum(:rating)
      total_reviews = restaurant.reviews.count
      average_rating = total_ratings.to_f / total_reviews
      return average_rating.round(1)  # Round to one decimal place
    else
      return 0  # Or any default value you want
    end
  end

  # def destroy
  #   @restaurant.destroy
  #   redirect_to restaurants_path, status: :see_other
  # end

  private

  def set_params
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
