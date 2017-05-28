CarrierWave.configure do |config|
  if Rails.env.production?
  config.fog_provider = 'fog/aws'
  config.storage = :fog
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["S3_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
      region: 'us-east-2'
  }
  config.fog_directory  = "funnycars"
  config.fog_public     = false
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end