class Venue < ActiveRecord::Base
  attr_accessible :address, :alcohol, :allages, :name, :neighborhood, :stagesize
end
