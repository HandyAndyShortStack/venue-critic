class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper
  include CarrierWaveDirect::Uploader
  include CarrierWave::MimeTypes
  process :set_content_type

  version :thumb do
    process resize_to_fill: [100, 100]
  end

end
