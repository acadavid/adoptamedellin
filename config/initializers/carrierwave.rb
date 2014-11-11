CarrierWave.configure do |config|

  if Rails.env.development? || Rails.env.test?
    config.storage = :file

    def store_dir
      "#{Rails.root}/public/uploads/tmp"
    end
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               =>  'AWS',
      :aws_access_key_id      =>  ENV["KEY_ID"],
      :aws_secret_access_key  =>  ENV["ACCESS_KEY"],
      :region                 =>  'us-east-1'
    }
    config.fog_directory = 'adoptamedellin'
  end
end