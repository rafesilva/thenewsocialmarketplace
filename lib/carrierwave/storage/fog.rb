CarrierWave.configure do |config|
                        # required
config.fog_credentials = {
provider:              'aws',                        # required
aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        # required
aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                        # required
region:                ENV['AWS_REGION']               # optional, defaults to 'us-east-1'

}

config.cache_dir = Rails.root.join 'tmp', 'uploads'
config.fog_directory  = ENV['S3_BUCKET_NAME']
                                  # required
# config.fog_public     = false                                                 # optional, defaults to true
# config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end