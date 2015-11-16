##
# OutputFile Module
#
# This module provides the methods that enable saving generated passwords
# securely to a file.
#
# The encryption algorithm used is Blowfish, developed by Bruce Schneier.
#
# Copyright 2015 Richard Davis GPL v3
require 'crypt'

##
# Provides the output file module for use as a mixin.
#
module OutputFile
  ##
  # Encrypts a given file.
  #
  def encrypt(file)
    # TODO
  end

  ##
  # Decrypts a given file.
  #
  def decrypt(file)
    # TODO
  end

  ##
  # Saves passphrase(s) to a file.
  #
  def save_pass(pass, file)
    # TODO
  end

  ##
  # Opens a previously saved output file for reading.
  #
  def open_ofile(file)
    # TODO
  end
end
