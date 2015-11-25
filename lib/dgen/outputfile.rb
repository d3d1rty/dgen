##
# OutputFile Module
#
# This module provides the methods that enable saving generated passwords
# securely to a file.
#
# The encryption algorithm used is Blowfish, developed by Bruce Schneier.
#
# Copyright 2015 Richard Davis GPL v3
require 'crypt/blowfish'

##
# Provides the output file module for use as a mixin.
#
module OutputFile
  ##
  # Encrypts a given passphrase.
  #
  def self.encrypt(phrase, key)
    blowfish = Crypt::Blowfish.new(key)
    e_phrase = blowfish.encrypt_string(phrase)
    e_phrase
  end

  ##
  # Decrypts a given passphrase.
  #
  def self.decrypt(e_phrase, key)
    blowfish = Crypt::Blowfish.new(key)
    phrase = blowfish.decrypt_string(e_phrase)
    phrase
  end

  ##
  # Saves passphrase to a file.
  #
  def self.save_pass(phrase)
    print 'Enter name for output file => '
    o_file = gets.chomp
    f = File.open("#{o_file}", 'w+')
    print 'Enter a key for encryption => '
    key = gets.chomp
    e_phrase = encrypt(phrase, key)
    f.puts e_phrase
    f.close
  end

  ##
  # Saves passphrases to a file.
  #
  def self.save_batch(phrase)
    print 'Enter name for output file => '
    o_file = gets.chomp
    f = File.open("#{o_file}", 'w+')
    print 'Enter a key for encryption => '
    key = gets.chomp
    phrase.each do |p|
      e_phrase = encrypt(p, key)
      f.puts e_phrase
    end
    f.close
  end

  ##
  # Opens a previously saved output file for reading.
  #
  def self.open_ofile(file)
    print 'Enter a key for decryption => '
    key = gets.chomp
    File.foreach(file) do |l|
      e_phrase = l.chomp
      phrase = decrypt(e_phrase, key)
      puts "Decrypted passphrase: '#{phrase}'"
    end
  end
end
