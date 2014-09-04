Snoobi API Ruby SDK

Installation
------------

Add this line to your application's Gemfile:

    gem 'snoobi-sdk-ruby'

Usage
-----

Authenticate with your Snoobi api OAuth credentials:
```ruby
require 'snoobi/client'

client = Snoobi::Client.new({
  consumer_key: YOUR_CONSUMER_KEY,
  consumer_secret: YOUR_CONSUMER_SECRET,
  token: YOUR_TOKEN,
  token_secret: YOUR_TOKEN_SECRET})

```

Make API calls:
```ruby
// Get api status
result = client.get('health')

// Query data from api
payload = {
    "account" => "YOUR_ACCOUNT",
    "criteria" => false,
    "metrics" => [
        "visitors",
        "conversion"
    ],
    "start_date" => "2013-05-01",
    "end_date" => "2013-06-07T23:59:59",
    "group_by" => [
        "day"
    ],
    "filters" => [
        {
            "name" => "search_engine",
            "value" => "Google"
        }
    ],
    "limit" => {
        "from" => 10,
        "to" => 20
    }
}
client.post('data', payload)
```

Tests
-----
To run tests execute:
```
bundle exec rake spec
```
