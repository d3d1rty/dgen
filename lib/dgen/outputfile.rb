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

require 'crypt/blowfish'

module Dgen
  ##
  # = OutputFile
  # Author::    Dick Davis
  # Copyright:: Copyright 2015-2018 Dick Davis
  # License::   GNU Public License 3
  #
  # This module provides the methods that enable saving generated passwords
  # securely to a file.
  #
  # The encryption algorithm used is Blowfish, developed by Bruce Schneier.
  module OutputFile
    ##
    # Encrypts a plaintext file using blowfish encryption.
    def self.encrypt(file, key)
      bf = Crypt::Blowfish.new(key)
      bf.encrypt_file("plain_#{file}", file.to_s)
      File.delete("plain_#{file}")
    end

    ##
    # Decrypts a blowfish encrypted file.
    def self.decrypt(file, key)
      bf = Crypt::Blowfish.new(key)
      bf.decrypt_file(file.to_s, "decrypted_#{file}")
    end

    ##
    # Saves passphrase to a file.
    def self.save_pass(o_file, key, phrase)
      f = File.open("plain_#{o_file}", 'w+')
      f.puts phrase
      f.close
      encrypt(o_file, key)
    end

    ##
    # Saves passphrases to a file.
    def self.save_batch(o_file, key, phrases)
      f = File.open("plain_#{o_file}", 'w+')
      phrases.each do |phrase|
        f.write phrase + "\n"
      end
      f.close
      encrypt(o_file, key)
    end

    ##
    # Opens a previously saved output file for reading.
    def self.open_ofile(file, key)
      decrypt(file, key)
      File.foreach("decrypted_#{file}") do |l|
        puts "Decrypted passphrase: '#{l.chomp}'"
      end
      File.delete("decrypted_#{file}")
    end
  end
end
