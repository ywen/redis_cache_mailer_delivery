# -*- encoding: utf-8 -*-
require File.expand_path('../lib/redis_cache_mailer_delivery/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yi Wen"]
  gem.email         = ["hayafirst@gmail.com"]
  gem.description   = %q{Use Redis to store the Mail::Message when using in Rails}
  gem.summary       = %q{Use Redis to store the Mail::Message when using in Rails}
  gem.homepage      = "https://github.com/ywen/redis_cache_mailer_delivery"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "redis_cache_mailer_delivery"
  gem.require_paths = ["lib"]
  gem.version       = RedisCacheMailerDelivery::VERSION
  gem.add_runtime_dependency(%q<redis>)
  gem.add_runtime_dependency(%q<redis-objects>)
  gem.add_runtime_dependency(%q<actionmailer>)
  gem.add_development_dependency(%q<rspec>)
  gem.add_development_dependency(%q<guard-rspectacle>)
  gem.add_development_dependency(%q<growl>)
  gem.add_development_dependency(%q<rb-fsevent>)
end
