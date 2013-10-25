# Vim Arduino Ino

This script is based on [Vim Arduino][vim-arduino], but uses the
[Ino][ino] command line utility instead of the Java Arduino compiler.
It therefore runs in 64-bit environments and allows for compiling and
deployment of Arduino (\*.pde/\*.ino) sketches directly from Vim.

## Install

The plugin is structured for use with [Pathogen][pathogen] so installation
should be easy, assuming you have Pathogen installed.

## Requirements
[Ino][ino] must be installed on your computer for this plugin to work.
To install Ino, you can run ```easy_install ino``` or ```pip install ino```
if you have python installed. Alternately, you can download the [source][ino-source]
and run ```make install``` inside the directory.

If you plan on using this plugin with a board other than an Arduino
Uno, you'll need to configure Ino to use that board by following
the instructions found [here][ino-config].

## Usage
Vim Arduino Ino can be run using the following keys:

`<Leader>ac` - Compile the current sketch.

`<Leader>ad` - Compile and deploy the current sketch.

`<Leader>as` - Open a serial port in `screen`.


## Options
The default key mapping can be turned off by doing this in your `.vimrc`:

```
let g:vim_arduino_map_keys = 0
```

To open the serial monitor automatically after each deploy,
add this to your `.vimrc`:

```
let g:vim_arduino_auto_open_serial = 1
```


[ino-config]: http://inotool.org/quickstart#configuration-files
[ino-source]: https://pypi.python.org/pypi/ino/#downloads
[pathogen]: http://www.vim.org/scripts/script.php?script_id=2332
[ino]: http://inotool.org/
[vim-arduino]: https://github.com/tclem/vim-arduino
[arduino]: http://arduino.cc/en/Main/Software
