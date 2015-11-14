# PassGen Class
# Copyright 2015 Richard Davis GPL v3
class PassGen
  # creates array of random numbers
  def roll_nums
    numbers = []
    5.times do
      numbers.push(rand(1..6))
    end
    num = numbers.join('')
    num
  end

  # chooses words from wordlist
  def find_word(file, number)
    # scan file for number
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

  # generates and returns the pass phrase
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
end
