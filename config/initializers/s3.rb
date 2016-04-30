CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => 'AKIAJE4MFROVZYHWGSSQ',
      :aws_secret_access_key => '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',
      :region => 'sa-east-1'
  }
  config.fog_directory = "petsitter"
end