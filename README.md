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
config.action_mailer.redis_cache_settings = { :redis_key_name => "a_key_name_for_all_stored_emails",
:marshallable_converters => [:sequel_record_marshallable, Marshallable::Attrubute1] }
```

You don't have to define the settings, the default ```redis_key_name``` is 

```ruby
"redis_cache_mailer_delivery:mail_messages"
```

the default ```marshallable_converters``` is an empty array

The meaning of ```marshallable_converters``` will be discussed in the next section.

All the mails being delivered will be written into the redis storage. You can use

```ruby
RedisCacheMailerDelivery::Deliveries.all
```

to access all the mails

## Marshallable Converters

If you use Sequel and you set a sequel record into the Mail::Message (```mail.record = record```), the chances are you will encounter an error where you cannot serialize the message since the record might be a singleton.

The remedy provided by this gem is to provide a mechanism to make the mail to be marshallable before it marshals it, as well as some built-in class for making the object to be marshallable.

```marshallable_converters``` setting accepts an array. Each element could be a symbol, or a class. 

When it is a class, the class must have a class method ```marshallable``` which accpets the mail object as the only param. The method will take the mail and convert it into a marshallable object.

When it is a symbol, it means it is a built-in converter. For example ```:sequel_record_marshallable``` will convert a Mail::Message containg a singlton Sequel record into marshallable one by use Sequel's ```marshallable!``` method.

Currently the built-in only converter is ```:sequel_record_marshallable```

The order of the ```:marshallable_converters``` could be important. The gem always goes through the converters in the order.

So for example, if you have:

```ruby
config.action_mailer.redis_cache_settings = { :marshallable_converters => [Marshallable::Attrubute2, Marshallable::Attrubute1] }
```

The gem calls: ```object1 = Marshallable::Attrubute2.marshallable(mail)```, then it calls ```object2 = Marshallable::Attrubute1.marshallable(object1)```
 
So if you must have ```attrubute1``` to be marshallable first, then make the ```attrubute2``` marshallable. You have to switch the order in this example.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
