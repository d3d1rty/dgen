#dgen
##About
Using the diceware method to generate passwords results in stronger passwords that are more resistant to cracking. This project implements the diceware method to create passphrases that are strong and easy to remember.

Check out this XKCD comic to get a better idea: https://xkcd.com/936/

Read the official diceware page for a more detailed explanation of diceware and how to use the method for generating passphrases securely: http://world.std.com/~reinhold/diceware.html

##What it Does
This program requires only minimal user interaction. You specify the number of words that you want in the passphrase and the minimum length of the passphrase, and the program will generate a secure diceware passphrase that meets those requirements. It will display this passphrase to you in the terminal and allow you to save it to an encrypted output file if you so choose. Additionally, it will decrypt previously saved output file and display the passphrases that are contained.

##Installation
To install from rubygems, execute:

`gem install dgen`

Alternatively, you could build from source:

```
git clone https://github.com/d3d1rty/dgen.git
cd dgen
gem build dgen.gemspec
gem install ./dgen-0.3.1.gem
```

##Usage
* Execute command `dgen -h` for options
* Execute command `dgen -s` to generate a single passphrase
* Execute command `dgen -b` to generate multiple passphrases
* Enter the number of words to use in the passphrase(s)
  * The recommended minimum is 6 words
* Enter the minimum number of characters to use in the passphrase
  * The recommended minimum is 17 characters
* The program will display the generated passphrase at which point...
  * You can:
    * Write it down once
    * Commit it to memory
    * Destroy the paper copy
  * Or (recommended):
    * Allow the program to save the generated passphrases to an encrypted file.
* To open a previously saved output file, execute command `dgen -o FILENAME`
    * Provide the key for encryption
    * The program will read the file, decrypt the passphrases, and display them to the screen. The contents of the file will remain encrypted.

##TODO
* Write tests for OutputFile module

##Dependencies
Ruby 2.0 or higher

##Credits
Thanks to the Ruby community for the valuable learning resources.

##Questions/Comments/Concerns
If you have any questions regarding this project, send me a message and I'd be more than happy to explain my code.

