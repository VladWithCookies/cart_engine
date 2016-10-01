$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shopping_cart/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shopping_cart"
  s.version     = ShoppingCart::VERSION
  s.authors     = ["Vlad V"]
  s.email       = ["summervibeswith9pm@gmail.com"]
  s.summary     = "Summary of ShoppingCart."
  s.description = "Description of ShoppingCart."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0.rc2", "< 5.1"
  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_dependency("shoulda-context", ["~> 1.0", ">= 1.0.1"])
  s.add_dependency("shoulda-matchers", [">= 1.4.1", "< 3.0"])
  s.add_development_dependency("rails-controller-testing")

  s.add_dependency('reform-rails')
  s.add_dependency('aasm')
  s.add_dependency('enumerize')

  s.test_files = Dir["spec/**/*"]
end
