<!---
Copyright 2015-2018 Richard Davis

This file is part of dgen.

dgen is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

dgen is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with dgen.  If not, see <http://www.gnu.org/licenses/>.
--->

# dgen

## Table of Contents
* About
* Getting started
  * Installation
  * Usage
* Contributing
  * Code of Conduct
  * Code Style
  * Documentation
  * Testing
* TODO
* Credits

## About
Using the diceware method to generate passwords results in stronger passwords that are more resistant to cracking. This project implements the diceware method to create passphrases that are strong and easy to remember.

Check out this XKCD comic to get a better idea: https://xkcd.com/936/

Read the official diceware page for a more detailed explanation of diceware and how to use the method for generating passphrases securely: http://world.std.com/~reinhold/diceware.html

This program requires only minimal user interaction. You specify the number of words that you want in the passphrase and the minimum length of the passphrase, and the program will generate a secure diceware passphrase that meets those requirements. It will display this passphrase to you in the terminal and allow you to save it to an encrypted output file if you so choose. Additionally, it will decrypt previously saved output file and display the passphrases that are contained.

## Getting Started
### Installation
To install from rubygems, execute:

`gem install dgen`

Alternatively, you could build from source:

```
git clone https://github.com/d3d1rty/dgen.git
cd dgen
gem build dgen.gemspec
gem install ./dgen-0.5.0.gem
```

### Usage
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

## Contributing
### Code of Conduct
All contributions are welcome, but are merged at the discretion of the core
contributor(s). Contributions to the project will be
judged on their merits without respect to a contributor's publicly or
privately held beliefs, opinions, ideology, nationality, ethnicity, or
demographic. Most communications within the project should be limited to
project planning, development, bugfixing, or other relevant topics; for
off-topic discussions, contributors are expected to use good judgement
and to avoid intentionally abusive behavior. Conflict should be resolved
at the lowest level possible with minimal disruption to the project. Core
contributor(s) reserve the right to request that a contributor alter their
behavior, however, nothing in this code of conduct should be construed in
such a manner that it infringes upon any contributor's freedom of expression.

### Code Style
To keep a consistent code style, it is recommended to use
[rubocop](https://github.com/bbatsov/rubocop). If you use `vim` and
[syntastic](https://github.com/vim-syntastic/syntastic), you
can use `rubocop` as a Ruby checker. To manually run `rubocop`, you
can run the following commands:

```
# Run rubocop for the entire project
rubocop
# Run rubocop for a specific file
rubocop foo/bar.rb
```

### Documentation
Comment any code contributions according to the existing conventions within the project.
Reference the examples listed below:

Example top-level comment:

```
##
# = ClassNameGoesHere
# Author::    Dick Davis (+/- individual contributors)
# Copyright:: Copyright 2018 Dick Davis
# License::   GNU Public License 3
#
# This is a class that is something and does something.
```

Example method comment:

```
##
# This is a method that does something
```

Documentation should be regenerated prior to merging any branches into master. The latest
[documentation](https://d3d1rty.github.io/dgen/) auto-sources off the `docs/` folder on
the master branch. For more information on RDoc, go
[here](https://rdoc.github.io/rdoc/index.html).

```
# Run custom rake task to regenerate RDoc documentation
rake rdoc
```

### Testing
Integration tests should be written for all classes and methods. The test suite
can be run executed by rake task `rake test`.

## TODO
* Write tests for OutputFile module
* Improve error handling

## Dependencies
Ruby 2.0 or higher

## Credits
Thanks to the Ruby community for the valuable learning resources.
