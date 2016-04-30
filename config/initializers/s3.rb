CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => 'AKIAIFT25WAXDN6ZM36A',
      :aws_secret_access_key => '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',
      :region => 'sa-east-1'
  }
  config.fog_directory = "testezekisan"
end