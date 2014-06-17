CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id => ENV["AWS_S3_ID"],
	:aws_secret_access_key => ENV["AWS_S3_SECRET"]
  }
  config.fog_directory  = 'adoptamedellin'
  config.fog_public     = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
