class VenuesController < ApplicationController
  before_filter :find_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
    if @venue.save
      redirect_to @venue, notice: "Venue information saved"
    else
      render action: "new", alert: "Venue not saved"
    end
  end

  def show
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
    @venue.destroy
    redirect_to "/", notice: "Venue information destroyed"
  end

  private

    def find_venue
      @venue = Venue.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Couldn't find that venue"
      redirect_to root_path
    end

    def venue_params
      params.require(:venue).permit(:id, :name, :address, :neighborhood,
                                    :alcohol, :allages, :stagesize)
    end

end

