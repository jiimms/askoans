require 'carrierwave/orm/activerecord'

  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAIKXAZWCFKZRCMIYQ',
      :aws_secret_access_key => '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',
      :region => 'us-west-2'
    }
    config.fog_directory     =  'askons-assets'
  end
