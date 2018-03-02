lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'serious/version'

Gem::Specification.new do |spec|
  spec.name          = 'serious'
  spec.version       = Serious::VERSION
  spec.authors       = ['Erol Fornoles']
  spec.email         = ['erol.fornoles@gmail.com']

  spec.summary       = 'Because we take our tests seriously'
  spec.description   = 'The Serious™ Ruby Testing Library'
  spec.homepage      = 'https://github.com/Erol/serious'

  spec.files         = `git ls-files -z`.split('\x0').reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
end
