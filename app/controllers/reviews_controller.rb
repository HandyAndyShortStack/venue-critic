class ReviewsController < ApplicationController
  before_filter :find_review, only: [:show, :edit, :update, :destroy]

  def show
  end

private

  def find_review
    @review = Review.find(params[:id])
  end

end
