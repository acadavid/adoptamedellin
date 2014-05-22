CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIH7T7X2ZBL5M2RNA',
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'adoptamedellin'
  config.fog_public     = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
