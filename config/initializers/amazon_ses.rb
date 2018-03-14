creds = Aws::Credentials.new(ENV['S3_KEY'], ENV['S3_SECRET'])
Aws::Rails.add_action_mailer_delivery_method(:aws_sdk, credentials: creds, region: 'us-east-1')
