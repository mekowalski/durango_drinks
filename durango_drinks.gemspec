# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'durango_drinks/version'

Gem::Specification.new do |spec|
  spec.name          = "durango_drinks"
  spec.version       = DurangoDrinks::VERSION
  spec.authors       = ["Malind Nikulski"]
  spec.email         = ["malind.nikulski@gmail.com"]

  spec.summary       = %q{Providing users access to the bars, breweries and coffeeshops in Durango}
  spec.description   = %q{Durango Drinks}
  spec.homepage      = "https://github.com/menikulski/durango_drinks"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = "durango_drinks"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.8'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "10.4.2"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

end
