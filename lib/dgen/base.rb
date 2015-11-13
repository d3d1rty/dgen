# base script for dgen
require 'dgen/passgen'
# generates and returns the pass phrase
def generate_phrase(n_words, p_length, file)
  # create new PassGen Object
  # start loop
  # set w_num as return value from roll_num
  # push return value from find_word(file) into words array
  # end loop
  # set pass_phrase equal to return value from make_phrase(words)
  # return pass_phrase
end

# prompt user for number of words
# set n_words
# prompt user for length of passphrase
# set p_length
# create File object to read word-list.txt
# set phrase equal to return value of generate_phrase(n_words, p_length, file)
# display phrase
# close File object
