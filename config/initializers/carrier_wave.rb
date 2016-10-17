require 'carrierwave/orm/activerecord'

  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV["ACCESS_KEY"],
      :aws_secret_access_key => ENV["SECRET_ACCESS_KEY"],
      :region => 'us-west-2'
    }
    config.fog_directory     =  ENV["BUCKET"]
  end
