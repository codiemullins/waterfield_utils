$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "waterfield_utils/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "waterfield_utils"
  s.version     = WaterfieldUtils::VERSION
  s.authors     = ["Codie Mullins"]
  s.email       = ["codie.mullins@waterfield.com"]
  s.homepage    = ""
  s.summary     = "Summary of WaterfieldUtils."
  s.description = "Description of WaterfieldUtils."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.16"
  s.add_dependency "rake"

  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "simplecov"
end
