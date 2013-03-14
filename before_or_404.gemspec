# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'before_or_404/version'

Gem::Specification.new do |gem|
  gem.name          = "before_or_404"
  gem.version       = BeforeOr404::VERSION
  gem.authors       = ["Eugene Korpan"]
  gem.email         = ["korpan.eugene@gmail.com"]
  gem.description   = %q{adds before_filter which renders 404 page if exception was raised}
  gem.summary       = %q{adds before_filter which renders 404 page if exception was raised}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
