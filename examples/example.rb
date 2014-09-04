require_relative '../lib/snoobi.rb'

client = Snoobi::Client.new({
  consumer_key: 'CONSUMER_KEY',
  consumer_secret: 'CONSUMER_SECRET',
  token: 'TOKEN',
  token_secret: 'TOKEN_SECRET'})

result = client.get('health')
puts result
