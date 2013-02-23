$:.push File.expand_path("../lib", __FILE__)
require "groundworkcss/rails/version"

Gem::Specification.new do |s|
  s.name        = "groundworkcss-rails"
  s.version     = Groundworkcss::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ognjen Regoje"]
  s.email       = ["ognjen.regoje@gmail.com"]
  s.homepage    = "https://github.com/oregac/groundworkcss-rails"
  s.summary     = %q{Groundwork CSS for Rails 3+}
  s.description = %q{Gem that integrates Sidereel GroundworkCSS into Rails 3+}

  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + Dir["app/**/*"] + ["Rakefile", "README.md"]
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency             'railties',   '>= 3.1'
  s.add_dependency             'actionpack', '>= 3.1'
  s.add_runtime_dependency 'execjs'
  s.add_development_dependency 'rails', '>= 3.1'
  s.add_development_dependency 'less'
  s.add_development_dependency 'therubyracer', '0.11.1'
end
