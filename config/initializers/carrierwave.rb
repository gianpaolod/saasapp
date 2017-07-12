require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  # config.root = Rails.root.join('tmp') # adding these...
  # config.cache_dir = 'carrierwave' # ...two lines

  if Rails.env.production?
      config.storage :fog
      config.fog_provider = 'fog/aws'
      config.fog_credentials = {
        :provider               => 'AWS',                        # required
        :s3_access_key_id       => ENV['AWS_ACCESS_KEY_ID'],                        # required
        :s3_secret_access_key   => ENV['AWS_SECRET_ACCESS_KEY'],                     # required
        :region                 => ENV['AWS_REGION']                  # optional, defaults to 'us-east-1'

      }
      config.fog_directory  = ENV['S3_BUCKET_NAME']                             # required
      config.fog_public     = false                                   # optional, defaults to true
      config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
  
end
