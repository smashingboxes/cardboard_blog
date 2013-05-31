$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'cardboard-blog/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'cardboard-blog'
  s.version     = CardboardBlog::VERSION
  s.authors     = ['Leonel Galan', 'Michael Elfassy', 'Smashing Boxes']
  s.email       = ['leonel@smashingboxes.com']
  s.homepage    = 'http://smashingboxes.com'
  s.summary     = 'A blog for Cardboard'
  s.description = 'A blog for Cardboard'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 3.2.13'
  s.add_dependency 'impressionist'
  # s.add_dependency 'jquery-rails'

  s.add_development_dependency 'sqlite3'
end
