##
# OutputFile Module
#
# Copyright 2015 Richard Davis GPL v3
require 'crypt/blowfish'

##
# This module provides the methods that enable saving generated passwords
# securely to a file.
#
# The encryption algorithm used is Blowfish, developed by Bruce Schneier.
#
module OutputFile
  ##
  # Encrypts a plaintext file using blowfish encryption.
  #
  def self.encrypt(file, key)
    bf = Crypt::Blowfish.new(key)
    bf.encrypt_file("plain_#{file}", "#{file}")
    File.delete("plain_#{file}")
  end

  ##
  # Decrypts a blowfish encrypted file.
  #
  def self.decrypt(file, key)
    bf = Crypt::Blowfish.new(key)
    bf.decrypt_file("#{file}", "decrypted_#{file}")
  end

  ##
  # Saves passphrase to a file.
  #
  def self.save_pass(phrase)
    print 'Enter name for output file => '
    o_file = gets.chomp
    print 'Enter a key for encryption => '
    key = gets.chomp
    f = File.open("plain_#{o_file}", 'w+')
    f.puts phrase
    f.close
    encrypt(o_file, key)
  end

  ##
  # Saves passphrases to a file.
  #
  def self.save_batch(phrase)
    print 'Enter name for output file => '
    o_file = gets.chomp
    print 'Enter a key for encryption => '
    key = gets.chomp
    f = File.open("plain_#{o_file}", 'w+')
    phrase.each do |p|
      f.write p + "\n"
    end
    f.close
    encrypt(o_file, key)
  end

  ##
  # Opens a previously saved output file for reading.
  #
  def self.open_ofile(file)
    print 'Enter a key for decryption => '
    key = gets.chomp
    decrypt(file, key)
    File.foreach("decrypted_#{file}") do |l|
      puts "Decrypted passphrase: '#{l.chomp}'"
    end
    File.delete("decrypted_#{file}")
  end
end
