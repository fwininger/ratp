lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ratp/version'

Gem::Specification.new do |spec|
  spec.name          = 'ratp'
  spec.version       = Ratp::VERSION
  spec.authors       = ['Florian Wininger']
  spec.email         = ['fw.centrale@gmail.com']

  spec.summary       = 'A gem to use RATP opendata.'
  spec.description   = 'This gem expose all data provide by data.ratp.fr.'
  spec.homepage      = 'https://github.com/fwininger/ratp-opendata.'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'savon'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
