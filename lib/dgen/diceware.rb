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

require 'securerandom'

module Dgen
  ##
  # = Diceware
  # Author::    Dick Davis
  # Copyright:: Copyright 2015-2018 Dick Davis
  # License::   GNU Public License 3
  #
  # Methods to generate random numbers, select words from
  # word list using those numbers, and combine words into
  # a passphrase.
  #
  # The algorithm used to generate passwords is the Diceware method, developed
  # by Arnold Reinhold.
  module Diceware
    ##
    # Creates an array of random numbers generated securely.
    def self.roll_nums
      numbers = []
      5.times do
        numbers.push(SecureRandom.random_number(6) + 1)
      end
      num = numbers.join('')
      num
    end

    ##
    # Chooses words from the diceware word list for the passphrase.
    def self.find_word(number, word_list)
      File.foreach(word_list) do |line|
        num = line.slice(0, 5)
        @word = line.slice(6..-2)
        break if num == number
      end
      @word
    end

    ##
    # Generates and returns the passphrase.
    def self.make_phrase(n_words, n_chars, word_list)
      passphrase = ''
      loop do
        words = []
        n_words.times do
          words.push(find_word(roll_nums, word_list))
        end
        passphrase = words.join(' ')
        break unless passphrase.length < n_chars
      end
      passphrase
    end
  end
end
