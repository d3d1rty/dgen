# Copyright 2015-2018 Richard Davis
#
# This file is part of dgen.
#
# dgen is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# dgen is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with dgen.  If not, see <http://www.gnu.org/licenses/>.

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'dgen'
  s.version       = '0.5.0'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Richard Davis']
  s.email         = 'dick@rvdavis.me'
  s.homepage      = 'https://github.com/d3d1rty/dgen'
  s.summary       = 'A simple diceware password generator'
  s.description   = 'Using the diceware method to generate passwords results'\
                    ' in stronger passwords that are more resistant to'\
                    ' cracking. This project implements the diceware method to'\
                    ' create passphrases that are strong and easy to remember.'
  s.license       = 'GPL-3'
  s.files         = ['lib/dgen.rb',
                     'lib/dgen/base.rb',
                     'lib/dgen/passgen.rb',
                     'lib/dgen/diceware.rb',
                     'lib/dgen/outputfile.rb',
                     'lib/assets/word-list.txt']
  s.executables   = ['dgen']
  s.test_files    = ['test/test_passgen.rb',
                     'test/test_diceware.rb',
                     'test/assets/word-list.txt']
  s.require_path  = ['lib']
  s.add_runtime_dependency 'crypt', '~> 2.2', '>= 2.2.1'
end
