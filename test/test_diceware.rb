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
require 'dgen/diceware'

##
# = DicewareTest
# Author::    Dick Davis
# Copyright:: Copyright 2015-2018 Dick Davis
# License::   GNU Public License 3
#
# Tests the Diceware module.
class DicewareTest < Test::Unit::TestCase
  ##
  # Sets variables required for testing.
  def setup
    @n_words = 6
    @n_chars = 17
    path = File.expand_path(File.join(File.dirname(__FILE__),
                                      '..',
                                      'test/assets',
                                      'word-list.txt'))
    @word_list = File.new(path, 'r')
  end

  ##
  # Tests generating numbers for selecting random words.
  def test_roll_nums
    assert_match(/^\d{5}$/, Dgen::Diceware.roll_nums)
  end

  ##
  # Tests finding words from wordlist given a number.
  def test_find_word
    num = '11111'
    assert_equal(Dgen::Diceware.find_word(num, @word_list), 'a')
  end

  ##
  # Tests making a phrase with selected words.
  def test_make_phrase
    assert_match(/\w||\s{17,}/, Dgen::Diceware.make_phrase(@n_words,
                                                           @n_chars,
                                                           @word_list))
  end
end
