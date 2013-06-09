class Review < ActiveRecord::Base
  def venue
    Venue.find(venue_id)
  end
end
