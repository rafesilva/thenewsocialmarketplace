require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
                        # required
config.fog_credentials = {
provider:              'aws',                        # required
aws_access_key_id: ENV['S3_ACCESS_KEY'],                        # required
aws_secret_access_key:  ENV['S3_SECRET_KEY'],                        # required
region: ENV['S3_REGION']               # optional, defaults to 'us-east-1'

}

config.cache_dir = Rails.root.join 'tmp', 'uploads'
config.fog_directory  = ENV['S3_BUCKET']
                                  # required
# config.fog_public     = false                                                 # optional, defaults to true
# config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end