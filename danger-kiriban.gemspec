
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "danger_kiriban"

Gem::Specification.new do |spec|
  spec.name          = "danger-kiriban"
  spec.version       = DangerKiriban::VERSION
  spec.authors       = ["nobjas"]
  spec.email         = ["nobjas@gmail.com"]

  spec.summary       = "A Danger plugin for kiriban"
  spec.description   = "A Danger plugin for kiriban"
  spec.homepage      = "https://github.com/noblejasper/danger-kiriban"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency 'danger'
  spec.add_dependency 'kiriban_getter'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'pry'
end
