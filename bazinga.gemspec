$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bazinga/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bazinga"
  s.version     = Bazinga::VERSION
  s.authors     = ["Codie Mullins"]
  s.email       = ["codie.mullins@waterfield.com"]
  s.homepage    = ""
  s.summary     = "Summary of Bazinga."
  s.description = "Description of Bazinga."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails"

  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
