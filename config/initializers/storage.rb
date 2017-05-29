CarrierWave.configure do |config|
  
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'                    # required  
    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     ENV["S3_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
        region: 'us-east-2',

    }
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.fog_directory  = ENV["S3_BUCKET_NAME"]
    config.fog_public     = false
    # config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
    config.storage = :fog
    else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
  
end