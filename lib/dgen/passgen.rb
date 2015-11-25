##
# PassGen Module
#
# Copyright 2015 Richard Davis GPL v3
require 'securerandom'

##
# This module provides the methods that compose the password generator.
#
# The algorithm used to generate passwords is the Diceware method, developed
# by Arnold Reinhold.
#
module PassGen
  ##
  # Creates an array of random numbers generated securely.
  #
  def self.roll_nums
    numbers = []
    5.times do
      numbers.push(SecureRandom.random_number(6) + 1)
    end
    num = numbers.join('')
    num
  end

  ##
  # Opens and returns the file containing the diceware word list.
  #
  def self.open_wordlist
    path = File.expand_path(File.join(File.dirname(__FILE__),
                                      '..',
                                      'assets',
                                      'word-list.txt'))
    wordlist = File.new(path, 'r')
    wordlist
  end

  ##
  # Chooses words from the diceware word list for the passphrase.
  #
  def self.find_word(file, number)
    File.foreach(file) do |line|
      num = line.slice(0, 5)
      @word = line.slice(6..-2)
      break if num == number
    end
    @word
  end

  ##
  # Generates and returns the passphrase.
  #
  def self.make_phrase(n_words, p_length, file)
    loop do
      words = []
      n_words.times do
        words.push(find_word(file, roll_nums))
      end
      @pass_phrase = words.join(' ')
      break unless @pass_phrase.length < p_length
    end
    @pass_phrase
  end

  ##
  # Produces and displays a single passphrase.
  #
  def self.single(n_words, p_length)
    f = open_wordlist
    phrase = make_phrase(n_words, p_length, f)
    puts "Passphrase with spaces:    '#{phrase}'"
    puts "Passphrase without spaces: '#{phrase.delete(' ')}'"
    f.close
    phrase
  end

  ##
  # Produces and displays multiple passphrases.
  #
  def self.batch(n_words, p_length)
    f = open_wordlist
    phrase = []
    print 'How many passphrases to generate? => '
    num_pass = gets.chomp.to_i
    num_pass.times do |i|
      phrase.push(make_phrase(n_words, p_length, f))
      puts "Passphrase with spaces:    '#{phrase[i]}'"
      puts "Passphrase without spaces: '#{phrase[i].delete(' ')}'"
    end
    f.close
    phrase
  end
end
