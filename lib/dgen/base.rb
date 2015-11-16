##
# This script handles the behavior of the program based on the options
# provided by the user.

require 'optparse'
include 'dgen/passgen'
include 'dgen/outputfile'

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: dgen [options]'

  opts.on('-s', '--single', 'Generate a single passphrase') do
    options[:single] = true
  end

  opts.on('-b', '--batch', 'Generate multiple passphrases') do
    options[:batch] = true
  end

  opts.on('-o', '--open FILE', 'Opens previously encrypted output file') do
    options[:open] = true
  end

  opts.on('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end
end

optparse.parse!

file = ARGV[0]

if options[:open]
  begin
    open_ofile(file)
    exit
  rescue
    puts 'Unable to open file.'
    exit
  end
end

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
  batch_pass = batch(n_words, p_length)
  puts 'Save the passphrases in an encrypted file? (Y/N) => '
  save = gets.chomp!
  exit unless save.upcase == 'Y'
  save_pass(batch_pass)
else
  puts 'You did not enter a valid option. Try --help.'
end
