CarrierWave.configure do |config|
  if Rails.env.production?

    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['S3_key_id'],     # Access Key Id

      aws_secret_access_key: ENV['S3_key_secret'], # Secret Access Key

      region:                'ap-southeast-1'
    }
    config.fog_directory  = 'justudy' # bucket name
    config.storage :fog
  else
    config.storage :fog
    # config.storage :file
  end
end
