require 'carrierwave/orm/activerecord'

  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV["access_key"],
      :aws_secret_access_key => ENV["secret_access_key"],
      :region => 'us-west-2'
    }
    config.fog_directory     =  ENV["bucket"]
  end
