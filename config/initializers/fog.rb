CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAI3FF47R4CLAFQ7VQ',
    :aws_secret_access_key  => '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',
  }
  config.fog_directory  = 'adoptamedellin'
  config.fog_public     = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
