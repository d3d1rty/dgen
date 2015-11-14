# == Synopsis
#
# dgen: generates diceware passphrases
#
#
# == Usage
#
# dgen [OPTIONS]
#
# -h, --help:
#   show help
#
# -i, --interactive:
#   use the interactive menu to generate passphrases
#
# Copyright 2015 Richard Davis GPL v3
require 'optparse'
require 'dgen/passgen'

def interactive
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
end

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: dgen [options]'

  opts.on('-i', '--interactive', 'Manually enter constraints') do
    options[:interactive] = true
  end

  opts.on('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end
end

optparse.parse!

if options[:interactive]
  interactive
else
  puts 'You did not enter a valid option. Try --help.'
end
