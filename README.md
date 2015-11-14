#dgen
##About
Using the diceware method to generate passwords results in stronger passwords that are more resistant to cracking. This project implements the diceware method to create passphrases that are strong and easy to remember.

Check out this XKCD comic to get a better idea: https://xkcd.com/936/

Read the official diceware page for a more detailed explanation of diceware and how to use the method for generating passphrases securely: http://world.std.com/~reinhold/diceware.html

##What it Does
This program requires only minimal user interaction. You specify the number of words that you want in the passphrase and the minimum length of the passphrase, and the program will generate a secure diceware passphrase that meets those requirements. It will display this passphrase to you in the terminal, although future releases will include increased command-line functionality, the ability to write it directly to a file, and more.

##Installation
To install from rubygems, execute:

`gem install dgen`

Alternatively, you could build from source:

```
git clone https://github.com/d3d1rty/dgen.git
cd dgen
gem build dgen.gemspec
gem install ./dgen-0.1.0.gem
```

##Usage
* Execute command `dgen`
* Enter the number of words to use in the passphrase
  * The recommended minimum is 6 words
* Enter the minimum number of characters to use in the passphrase
  * The recommended minimum is 17 characters
* The program will display the generated passphrase
  * Write it down once
  * Commit it to memory
  * Destroy the paper copy

##TODO
* Write Rdoc's
* Implement Getoptlong to parse command line arguments
  * Code to generate and output (multiple) passphrases to a file
    * Allow user to specify path to file
    * Code to generate multiple passphrases
    * Code to encrypt the output file
  * Include option for single passphrase use with output to screen (current functionality)
  * Include switches to allow user to set number of words and length of passphrase as arguments
  * Display help options and usage

##Dependencies
Ruby 2.0 or higher

##Credits
Thanks to the Ruby community for the valuable learning resources.

##Questions/Comments/Concerns
If you have any questions regarding this project, send me a message and I'd be more than happy to explain my code.

