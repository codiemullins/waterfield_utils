# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../spec/dummy/config/environment.rb", __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../spec/dummy/db/migrate", __FILE__)]

# Load fixtures from the engine
RSpec.configure do |config|
  config.warnings = true
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
