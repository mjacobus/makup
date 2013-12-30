$:.push File.expand_path("../lib", __FILE__) # Maintain your gem's version:
require "makup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "makup"
  s.version     = Makup::VERSION
  s.authors     = ["Marcelo Jacobus"]
  s.email       = ["marcelo.jacobus@gmail.com"]
  s.license     = ['MIT']
  s.homepage    = "https://github.com/mjacobus/makup"
  s.summary     = "Makup for Draper decorator"
  s.description = <<DESC
  Makup for Draper decorator.
  Localize numbers, dates and times.
  Provides a way for overriding the way specific types are decorated
DESC

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 3.2"
  s.add_dependency "draper"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "sqlite3"
end
