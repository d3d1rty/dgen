# Copyright 2015-2018 Richard Davis
#
# This file is part of dgen.
#
# dgen is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# dgen is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with dgen.  If not, see <http://www.gnu.org/licenses/>.

require 'optparse'
require 'dgen/passgen.rb'
require 'dgen/diceware.rb'
require 'dgen/outputfile.rb'

##
# = base.rb
# Author::    Dick Davis
# Copyright:: Copyright 2015-2018 Dick Davis
# License::   GNU Public License 3
#
# The main script for program execution.

# Catches interrupt signal to terminate program execution.
trap('INT') do
  puts "\nTerminating..."
  exit
end

# Parses command-line options to determine program flow.
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

# Opens, decrypts, and displays previously saved passphrase file.
if options[:open]
  print 'Enter a key for decryption => '
  key = gets.chomp
  begin
    Dgen::OutputFile.open_ofile(options[:file], key)
    exit
  rescue IOError
    puts 'An error occurred while trying to open the file.'
    exit
  end
elsif options.empty?
  puts 'You did not enter a valid option. Try --help.'
  exit
end

# Initializes generator with user-provided configuration options.
print 'Number of words for phrase (recommended minimum is 6 words) => '
n_words = gets.chomp.to_i
print 'Length of passphrase (recommended minimum is 17 characters) => '
p_length = gets.chomp.to_i
generator = Dgen::PassGen.new(n_words, p_length)

# Generates a single passphrase and optionally saves to encrypted file.
if options[:single]
  single_pass = generator.single
  puts "Passphrase:        #{single_pass}"
  puts 'Save this passphrase in an encrypted file? (Y/N) => '
  save = gets.chomp
  exit unless save.casecmp('Y').zero?
  begin
    print 'Enter name for output file => '
    o_file = gets.chomp
    print 'Enter a key for encryption => '
    key = gets.chomp
    Dgen::OutputFile.save_pass(o_file, key, single_pass)
  rescue IOError
    puts 'Unable to save passphrase to output file.'
    exit
  end

# Generates multiple passphrases and optionally saves to encrypted file.
elsif options[:batch]
  print 'How many passphrases to generate? => '
  n_pass = gets.chomp.to_i
  batch_pass = generator.batch(n_pass)
  batch_pass.each do |pass|
    puts "Passphrase:        '#{pass}'"
  end
  print 'Save the passphrases in an encrypted file? (Y/N) => '
  save = gets.chomp
  exit unless save.casecmp('Y').zero?
  begin
    print 'Enter name for output file => '
    o_file = gets.chomp
    print 'Enter a key for encryption => '
    key = gets.chomp
    Dgen::OutputFile.save_batch(o_file, key, batch_pass)
  rescue IOError
    puts 'Unable to save passphrases to output file.'
    exit
  end
end
