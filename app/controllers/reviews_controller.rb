class ReviewsController < ApplicationController
  before_filter :authenticate_user!, only: [ :create, :new, :update, :edit, :destroy ]
  before_filter :find_venue
  before_filter :find_review, only: [:show, :edit, :update, :destroy]

  def new
    @review = @venue.reviews.build
  end

  def create
    review_params["user_id"] = current_user.id
    @review = @venue.reviews.build(review_params)
    if @review.save
      redirect_to [@venue, @review], notice: "review saved"
    else
      render action: "new", alert: "review not saved"
    end
  end

  def show
  end

private

  def review_params
    params.require(:review).permit(
                                    :user_id, :venue_id, :overall, :note,
                                    :dispute, :soundequip, :soundtech,
                                    :compensation, :compdescr
                                  ).merge(user_id: current_user.id)
  end

  def find_review
    @review = Review.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Couldn't find that review"
    redirect_to root_path
  end

  def find_venue
    @venue = Venue.find(params[:venue_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Couldn't find that venue"
    redirect_to root_path
  end

end
