class Review < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user
end
