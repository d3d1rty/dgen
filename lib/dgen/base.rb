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
include 'dgen/passgen'
include 'dgen/crypto'

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: dgen [options]'

  opts.on('-s', '--single', 'Generate a single passphrase') do
    options[:single] = true
  end

  opts.on('-b', '--batch', 'Generate multiple passphrases') do
    options[:batch] = true
  end

  opts.on('-e', '--encrypt FILE', 'Encrypts a specified file') do
    options[:encrypt] = true
  end

  opts.on('-d', '--decrypt FILE', 'Decrypts a specified file') do
    options[:decrypt] = true
  end

  opts.on('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end
end

optparse.parse!

file = ARGV[0]

encrypt(file) if options[:encrypt]
decrypt(file) if options[:decrypt]

print 'Number of words for phrase (recommended minimum is 6 words) => '
n_words = gets.chomp.to_i
print 'Length of passphrase (recommended minimum is 17 characters) => '
p_length = gets.chomp.to_i

if options[:single]
  single_pass = single(n_words, p_length)
  entropy(single_pass)
  puts 'Save this passphrase in an encrypted file? (Y/N) => '
  save = gets.chomp!
  exit unless save.upcase == 'Y'
  save_pass(single_pass)
elsif options[:batch]
  batch_pass = batch
  entropy(batch_pass)
  puts 'Save the passphrases in an encrypted file? (Y/N) => '
  save = gets.chomp!
  exit unless save.upcase == 'Y'
  save_pass(batch_pass)
else
  puts 'You did not enter a valid option. Try --help.'
end
