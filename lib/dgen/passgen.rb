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

require 'dgen/diceware'

module Dgen
  ##
  # = PassGen
  # Author::    Dick Davis
  # Copyright:: Copyright 2015-2018 Dick Davis
  # License::   GNU Public License 3
  #
  # Generates secure diceware passphrases.
  #
  # The algorithm used to generate passwords is the Diceware method, developed
  # by Arnold Reinhold.
  class PassGen
    # Number of words to use in passphrase.
    attr_reader :n_words
    # Minimum character length of passphrase.
    attr_reader :n_chars
    # File containing the list of words to select words from.
    attr_reader :word_list

    ##
    # Initializes a PassGen instance
    def initialize(n_words, n_chars)
      @n_words = n_words
      @n_chars = n_chars
      path = File.expand_path(File.join(File.dirname(__FILE__),
                                        '..',
                                        'assets',
                                        'word-list.txt'))
      @word_list = File.new(path, 'r')
    end

    ##
    # Produces and displays a single passphrase.
    def single
      Dgen::Diceware.make_phrase(@n_words, @n_chars, @word_list)
    end

    ##
    # Produces and displays multiple passphrases.
    def batch(n_pass)
      phrases = []
      n_pass.times do
        phrases.push(Dgen::Diceware.make_phrase(@n_words, @n_chars, @word_list))
      end
      phrases
    end
  end
end
