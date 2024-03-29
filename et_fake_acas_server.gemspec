
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "et_fake_acas_server/version"

Gem::Specification.new do |spec|
  spec.name          = "et_fake_acas_server"
  spec.version       = EtFakeAcasServer::VERSION
  spec.authors       = ["Gary Taylor"]
  spec.email         = ["gary.taylor@hmcts.net"]

  spec.summary       = %q{Employment Tribunal (govuk) fake acas server}
  spec.description   = %q{Standalone fake acas server for use during dev and test of the employment tribunal system}
  spec.homepage      = "https://github.com/ministryofjustice/et_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_dependency 'iodine', '~> 0.7'
  spec.add_dependency 'sinatra-contrib', '~> 3.0'
  spec.add_dependency 'sinatra', '~> 3.0'
  spec.add_dependency 'nokogiri', '~> 1.8', '>= 1.8.2'
  spec.add_dependency 'activesupport', '>= 6.1'
end
