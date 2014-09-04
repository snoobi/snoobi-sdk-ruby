lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snoobi/version'

Gem::Specification.new do |s|
  s.name          = 'snoobi-sdk-ruby'
  s.version       = Snoobi::VERSION
  s.date          = '2014-01-11'
  s.summary       = %q{This SDK contains wrapper code used to call the Snoobi API from Ruby}
  s.description   = %q{This SDK contains wrapper code used to call the Snoobi API from Ruby}
  s.authors       = ["Snoobi"]
  s.require_path  = 'lib'
  s.files         = ['snoobi-sdk-ruby.gemspec','Rakefile','Gemfile','README.md']+Dir["#{File.dirname(__FILE__)}"'/lib/**/*.rb']
  s.homepage      = 'https://api.snoobi.com/'

  s.add_runtime_dependency 'oauth', '~> 0.4.7'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
end
