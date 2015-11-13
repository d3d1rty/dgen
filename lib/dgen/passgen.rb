# PassGen Class
class PassGen
  # gets constraint information
  def initialize(n_words, p_length)
    # @n_words set number of words. recommended 6 word minimum
    # @p_length set passphrase length. recommended > 17 (including spaces)
    # hold words in array
  end

  # creates array of random numbers
  def roll_num
    # randomly generate 5 single digit numbers
    # squeeze into one number
    # return number
  end

  # chooses words from wordlist
  def find_word(file)
    # scan file for number
    # select word for corresponding number
    # verify word meets constraints
    # return word
  end

  # makes the passphrase from the chosen words
  def make_phrase(words)
    # read values from array
    # store as string
    # return pass phrase
  end

  private :n_words, :p_length
end
