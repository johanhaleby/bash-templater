# BASH Templater

Very simple templating system that replace `{{VAR}}` by `$VAR` environment value.

Supports default values by writting `{{VAR=value}}` in the template.

[![Build Status](https://travis-ci.org/lavoiesl/bash-templater.svg?branch=master)](https://travis-ci.org/lavoiesl/bash-templater)

## Author

Sébastien Lavoie <github@lavoie.sl>

Johan Haleby

See http://code.haleby.se/2015/11/20/simple-templating-engine-in-bash/  and http://blog.lavoie.sl/2012/11/simple-templating-system-using-bash.html for more details

## Installation

`templater.sh` has no external dependencies. You can use it by directly executing. 

To install `templater.sh` globally in Linux, type:

    sudo curl -L https://raw.githubusercontent.com/johanhaleby/bash-templater/master/templater.sh -o /usr/local/bin/templater.sh
    sudo chmod +x /usr/local/bin/templater.sh

## Usage
	
VAR=value templater.sh template
```

Read variables from file:
    
```bash
templater.sh template -f variables.txt
```

```bash
# Using external configuration file (and don't print the warnings)
templater.sh template -f variables.txt -s

# Passing arguments directly
VAR=value templater.sh template

# Evaluate /tmp/foo and pass those variables to the template
# Useful for defining variables in a file
# Parentheses are important for not polluting the current shell
(set -a && . /tmp/foo && templater.sh template)

# A variant that does NOT pass current env variables to the templater
sh -c "set -a && . /tmp/foo && templater.sh template"
```

## Examples
See examples/
