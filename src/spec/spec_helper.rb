# ------------------------------------------------------------
# Rspec Config
# ------------------------------------------------------------

require 'java'

base_dir = File.expand_path("../..", __FILE__)
pattern = "#{base_dir}/code/**/*.jar"

Dir.glob(pattern).each do |jar|
    require jar
end

require 'pp'

# Require all support files from spec/support (shared examples, factories etc.)
Dir[File.dirname(__FILE__) + '/support/*.rb'].each {|file| require file }

# Rspec configuration & mixins
RSpec.configure do |conf|
# clean out jruby-related stacktrace lines that do not add meaningful information
    conf.backtrace_exclusion_patterns << /sun\.reflect/
    conf.backtrace_exclusion_patterns << /org\.jruby/
end
