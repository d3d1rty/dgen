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

require 'test/unit'
require 'dgen/passgen'

##
# = PassGenTest
# Author::    Dick Davis
# Copyright:: Copyright 2015-2018 Dick Davis
# License::   GNU Public License 3
#
# Tests the Dgen::PassGen class.
class PassGenTest < Test::Unit::TestCase
  ##
  # Instantiates a Dgen::PassGen instance for testing.
  def setup
    @generator = Dgen::PassGen.new(6, 17)
  end

  ##
  # Tests generation of a single passphrase.
  def test_single
    assert_match(/\w||\s{17,}/, @generator.single)
  end

  ##
  # Tests generation of multiple passphrases.
  def test_batch
    passphrases = @generator.batch(3)
    assert_equal(3, passphrases.length)
    assert_match(/\w||\s{17,}/, passphrases[0])
    assert_match(/\w||\s{17,}/, passphrases[1])
    assert_match(/\w||\s{17,}/, passphrases[2])
  end
end
