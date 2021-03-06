class Venue < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  accepts_nested_attributes_for :reviews
  mount_uploader :image, ImageUploader
end
