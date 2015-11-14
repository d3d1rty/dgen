# base script for dgen
# Copyright 2015 Richard Davis GPL v3
require 'dgen/passgen'

print 'Number of words for phrase (recommended minimum is 6 words) => '
n_words = gets.chomp.to_i
print 'Length of passphrase (recommended minimum is 17 characters) => '
p_length = gets.chomp.to_i
path = File.expand_path(File.join(File.dirname(__FILE__),
                                  '..',
                                  'assets',
                                  'word-list.txt'))
f = File.new(path, 'r')
phrase = PassGen.new.generate_phrase(n_words, p_length, f)
puts "Passphrase with spaces:    '#{phrase}'"
puts "Passphrase without spaces: '#{phrase.delete(' ')}'"
f.close
