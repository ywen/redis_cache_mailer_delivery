# RedisCacheMailerDelivery

[![Build Status](https://secure.travis-ci.org/ywen/redis_cache_mailer_delivery.png)](http://travis-ci.org/ywen/redis_cache_mailer_delivery)


This gem is inspired by https://github.com/p0deje/action_mailer_cache_delivery.

If you are using Resque for sending mails asynchronously, and you want to test the mail sending asynchronously in your integration tests, then you can use this gem for just that.

The gem adds a new delivery method to the ActionMailer and it stores the marshaled Mail::Message being delivered into a redis list which can be fetched by any other processes.

A separate Resque worker process deliver emails, which being written into a redis storage. The test process (such as a cucumber step can then fetch the mail for examination).
 
## Installation

Add this line to your application's Gemfile:

    gem 'redis_cache_mailer_delivery'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redis_cache_mailer_delivery

## Usage

In a Rails project, in your environment files such as config/environments/cucumber.rb

```ruby
config.action_mailer.delivery_method = :redis_cache
config.action_mailer.redis_cache_settings = { :redis_key_name => "a_key_name_for_all_stored_emails" }
```

You don't have to define the redis_key_name, the default is 

```ruby
"redis_cache_mailer_delivery:mail_messages"
```

All the mails being delivered will be written into the redis storage. You can use

```ruby
ActionMailer::Base.cached_deliveries
```

to access all the mails

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
