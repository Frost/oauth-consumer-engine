# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "oauth_consumer_engine/version"

Gem::Specification.new do |s|
  s.name        = "oauth_consumer_engine"
  s.version     = OauthConsumerEngine::VERSION
  s.authors     = ["Martin Frost"]
  s.email       = ["frost+oauth-engine@ceri.se"]
  s.homepage    = ""
  s.summary     = %q{A drop-in oauth authentication engine}
  s.description = %q{A gemified rails engine providing oauth authentication}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency 'rails'
  s.add_dependency "omniauth", [">= 1.2.1"]
  s.add_dependency "omniauth-oauth2", [">= 1.1.2"]
  s.add_dependency "multi_json"
end
