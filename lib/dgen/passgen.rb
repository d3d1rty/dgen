# PassGen Class
# Copyright 2015 Richard Davis GPL v3
require 'securerandom'

# creates a generator mixin
module PassGen
  # creates array of random numbers
  def roll_nums
    numbers = []
    5.times do
      numbers.push(SecureRandom.random_number(6) + 1)
    end
    num = numbers.join('')
    num
  end

  # chooses words from wordlist
  def find_word(file, number)
    File.foreach(file) do |line|
      num = line.slice(0, 5)
      @word = line.slice(6..-2)
      break if num == number
    end
    @word
  end

  # makes the passphrase from the chosen words
  def make_phrase(words)
    phrase = words.join(' ')
    phrase
  end

  # determines entropy for a given passphrase
  def entropy(phrase)
  end

  # generates and returns the passphrase
  def generate_phrase(n_words, p_length, file)
    loop do
      words = []
      n_words.times do
        words.push(find_word(file, roll_nums))
      end
      @pass_phrase = make_phrase(words)
      break unless @pass_phrase.length < p_length
    end
    @pass_phrase
  end

  # produces a single passphrase
  def single(n_words, p_length)
    path = File.expand_path(File.join(File.dirname(__FILE__),
                                      '..',
                                      'assets',
                                      'word-list.txt'))
    f = File.new(path, 'r')
    phrase = generate_phrase(n_words, p_length, f)
    puts "Passphrase with spaces:    '#{phrase}'"
    puts "Passphrase without spaces: '#{phrase.delete(' ')}'"
    f.close
    phrase
  end

  # generates multiple passphrases
  def batch(n_words, p_length)
    print 'How many passphrases to generate? => '
    num_pass = gets.chomp.to_i
    path = File.expand_path(File.join(File.dirname(__FILE__),
                                      '..',
                                      'assets',
                                      'word-list.txt'))
    f = File.new(path, 'r')
    num_pass.times do |i|
      phrase.push(generate_phrase(n_words, p_length, f))
      puts "Passphrase with spaces:    '#{phrase[i]}'"
      puts "Passphrase without spaces: '#{phrase[i].delete(' ')}'"
    end
    f.close
    phrase
  end
end
