require 'fog/aws'

CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  elsif Rails.env.development?
    config.storage = :file
  else
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_KEY'],
      aws_secret_access_key: ENV['S3_SECRET']
    }
    config.storage = :fog
    config.fog_directory = 'gotkayak-images'
    config.fog_host = 'https://s3.amazonaws.com/gotkayak-images'
    config.fog_public = true
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end
