# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'dgen'
  s.version       = '0.3.0'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Richard Davis']
  s.email         = 'dick@sbdsec.com'
  s.homepage      = 'https://github.com/d3d1rty/dgen'
  s.summary       = 'A simple diceware password generator'
  s.description   = <<-EOF
  Using the diceware method to generate passwords results in stronger passwords
  that are more resistant to cracking. This project implements the diceware
  method to create passphrases that are strong and easy to remember.
  EOF
  s.license       = 'GPL v3'
  s.files         = ['lib/dgen.rb',
                     'lib/dgen/base.rb',
                     'lib/dgen/passgen.rb',
                     'lib/dgen/outputfile.rb',
                     'lib/assets/word-list.txt']
  s.executables   = ['dgen']
  s.test_files    = ['test/test_dgen.rb']
  s.require_path  = ['lib']
  s.add_runtime_dependency 'crypt', '~> 2.2.1'
end
