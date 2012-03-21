# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# NOTE: When using watch with a block, you must return all files that should be reloaded.
guard :rspectacle, :cli => '--format documentation --backtrace' do
  watch('spec/spec_helper.rb')                        { %w(spec/spec_helper spec) }

  watch(%r{^spec/.+_spec\.rb$})

  watch(%r{^lib/(.+)\.rb$})                           { |m| ["lib/#{m[1]}.rb", "spec/lib/#{m[1]}_spec.rb"] }
end
