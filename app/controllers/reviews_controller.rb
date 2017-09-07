class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new

    @review.user_name = params[:review][:user_name]
    @review.review = params[:review][:review]
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to product_path(params[:product_id])
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
  end

  def update
    @review = Review.find(params[:id])

    @review.user_name = params[:review][:user_name]
    @review.review = params[:review][:review]
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to product_path(params[:product_id])
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Your review has been deleted"

    redirect_to product_path(params[:id])
  end

end
