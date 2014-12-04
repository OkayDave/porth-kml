# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "porth-kml/version"

Gem::Specification.new do |s|
  s.name        = "porth-kml"
  s.version     = Porth::KML::VERSION
  s.authors     = ["Matt Connolly"]
  s.email       = ["matt.connolly@me.com"]
  s.homepage    = ""
  s.summary     = %q{Plain Old Ruby Template KML handler}
  s.description = %q{Plain Old Ruby Template KML handler}

  s.rubyforge_project = "porth-kml"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency 'porth'
  s.add_runtime_dependency 'ruby_kml'
 
  

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake',     '~> 0.9.2'
end
