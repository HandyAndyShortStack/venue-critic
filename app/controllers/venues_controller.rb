class VenuesController < ApplicationController
  before_filter :find_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new(key: params[:key])
  end

  def create
    @venue = Venue.create(venue_params)
    if @venue.save
      redirect_to @venue, notice: "Venue information saved"
    else
      flash[:alert] = "Venue not saved"
      render action: "new"
    end
  end

  def show
    @uploader = Venue.new.image
    @uploader.success_action_redirect = venues_path
  end

  def edit
  end

  def update
    if @venue.update_attributes(venue_params)
      redirect_to @venue, notice: "Venue information updated"
    else
      render action: "edit", alert: "Venue information unchaged"
    end
  end

  def destroy
    if @venue.destroy
      redirect_to "/venues", notice: "Venue information destroyed"
    else
      redirect_to @venue, notice: "there was a problem deleting this venue"
    end
  end

  private

    def find_venue
      @venue = Venue.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Couldn't find that venue"
      redirect_to root_path
    end

    def venue_params
      params.require(:venue).permit(:id, :name, :address, :neighborhood, :key,
                                    :alcohol, :allages, :stagesize, :image)
    end

end

