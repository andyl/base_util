# Dotfile and Utility Scripts

## Usage

To use:
  mkdir ~/util
  cd ~/util
  git clone git://github.com/andyl/base_util.git
  base_util/init

## Layout

You can have any number of util directories that
live alongside base_util.  For example, you may 
have private utilities for development, or 
deployment.  

Each directory should have two sub-directories: 
'cfg' and 'bin'.  

Each bin directory will go on your path.

Each file and directory under 'cfg' beginning with
an underscore will be symlinked as a ~/.dotfile.  

Some programs store their configuration data under
the ~/.config directory.  To support this, the
cfg symlinking supports nested config directories.

Nested paths must be encoded using the following filename conventions:
-> a single '+' character to show the dotfile root
-> a single '^' character to show where to built the symlink

## Examples

-------------------------------------------------
For example:
~/util/base_util/cfg/+config/app/^subdir/myfile

Will generate:
~/.config/app/subdir -> ~/util/base_util/cfg/+config/app/^subdir

-------------------------------------------------
For example:
~/util/base_util/cfg/+config/^app/myfile

Will generate:
~/.config/app -> ~/util/base_util/cfg/+config/^app

## FINI
