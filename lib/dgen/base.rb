##
# Base Script
#
# This script handles the behavior of the program based on the options
# provided by the user.
#
# Copyright 2015 Richard Davis GPL v3
require 'optparse'
require 'dgen/passgen.rb'
require 'dgen/outputfile.rb'

trap('INT') do
  puts 'Terminating...'
  exit
end

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: dgen [options]'

  opts.on('-s', '--single', 'Generate a single passphrase') do
    options[:single] = true
  end

  opts.on('-b', '--batch', 'Generate multiple passphrases') do
    options[:batch] = true
  end

  opts.on('-o', '--open file', 'Opens encrypted output file') do |file|
    options[:open] = true
    options[:file] = file
  end

  opts.on('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end
end

optparse.parse!

if options[:open]
  begin
    OutputFile.open_ofile(options[:file])
    exit
  rescue
    puts 'An error occurred while trying to open the file.'
    exit
  end
elsif options.empty?
  puts 'You did not enter a valid option. Try --help.'
  exit
end

print 'Number of words for phrase (recommended minimum is 6 words) => '
n_words = gets.chomp.to_i
print 'Length of passphrase (recommended minimum is 17 characters) => '
p_length = gets.chomp.to_i

if options[:single]
  single_pass = PassGen.single(n_words, p_length)
  puts 'Save this passphrase in an encrypted file? (Y/N) => '
  save = gets.chomp
  exit unless save.upcase == 'Y'
  begin
    OutputFile.save_pass(single_pass)
  rescue
    puts 'Unable to save passphrase to output file.'
    exit
  end
elsif options[:batch]
  batch_pass = PassGen.batch(n_words, p_length)
  puts 'Save the passphrases in an encrypted file? (Y/N) => '
  save = gets.chomp
  exit unless save.upcase == 'Y'
  begin
    OutputFile.save_batch(batch_pass)
  rescue
    puts 'Unable to save passphrases to output file.'
    exit
  end
end
