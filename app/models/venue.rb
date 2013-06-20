class Venue < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  accepts_nested_attributes_for :reviews

  mount_uploader :image, ImageUploader, mount_on: :image

  after_save :enqueue_image

  def image_name
    File.basename(image.path || image.filename) if image
  end

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present? && image.present?
  end

  class ImageWorker
    include Sidekiq::Worker

    def perform(id, key)
      venue = Venue.find(id)
      venue.key = key
      venue.remote_image_url = venue.image.direct_fog_url(with_path: true)
      venue.save!
      venue.update_column(:image_processed, true)
    end
  end

end
