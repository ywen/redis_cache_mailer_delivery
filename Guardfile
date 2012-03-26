# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# NOTE: When using watch with a block, you must return all files that should be reloaded.
guard :rspectacle, :cli => '--format documentation --backtrace' do
  watch('spec/spec_helper.rb')                        { %w(spec/spec_helper spec) }

  watch(%r{^spec/.+_spec\.rb$})
  watch('lib/redis_cache_mailer_delivery.rb')  { ['spec/redis_cache_mailer_delivery_spec.rb', 'lib/redis_cache_mailer_delivery.rb' ] }
  watch('lib/redis_cache_mailer_delivery/mail/(.+).rb')  {|m| ["spec/redis_cache_mailer_delivery/mail/#{m[1]}_spec.rb", "lib/redis_cache_mailer_delivery/mail/#{m[1]}.rb" ] }
  watch('lib/redis_cache_mailer_delivery/(.+).rb')  {|m| ["spec/redis_cache_mailer_delivery/#{m[1]}_spec.rb", "lib/redis_cache_mailer_delivery/#{m[1]}.rb" ] }
end
