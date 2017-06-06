# Vim Arduino Ino

## UPDATE: THIS PROJECT IS DEPRECATED
### As of now, the Arduino Ino command line tool [does not work](https://github.com/amperka/ino/issues/71) with newer versions of the Arduino app. Thus, this tool will not work unless you install an older version of the Arduino app. If someone wants to contribute an update to Ino that supports newer versions of the app, they can submit a pull request to the [current repo](https://github.com/scottdarch/Arturo).

This script is based on [Vim Arduino][vim-arduino], but uses the
[Ino][ino] command line utility instead of the Java Arduino compiler.
It therefore runs in 64-bit environments and allows for compiling and
deployment of Arduino (\*.pde/\*.ino) sketches directly from Vim.

## Install

The plugin is structured for use with [Pathogen][pathogen] so installation
should be easy, assuming you have Pathogen installed.

## Requirements
[Ano][ano] must be installed on your computer for this plugin to work (Previously, Ino was used, but that repo is no longer maintained).
To install Ano, you can install from source using the instructions [here][ano] or ```npm install ano``` if you have npm installed.

If you plan on using this plugin with a board other than an Arduino
Uno, you'll need to configure Ino to use that board by following
the instructions found [here][ino-config].

## Usage
Vim Arduino Ino can be run using the following keys:

`<Leader>ac` - Compile the current sketch.

`<Leader>ad` - Compile and deploy the current sketch.

`<Leader>as` - Open a serial port in `screen`.

In order for the build to complete successfully, your project directory will need to be set up like a normal ino project. For more information on ino project setup, see [here][ino-project].


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

To change the command used to build and deploy :

```
let g:vim_arduino_ino_cmd = 'ano'
```


[ino-config]: http://inotool.org/quickstart#configuration-files
[pathogen]: http://www.vim.org/scripts/script.php?script_id=2332
[ano]: https://github.com/scottdarch/Arturo
[vim-arduino]: https://github.com/tclem/vim-arduino
[arduino]: http://arduino.cc/en/Main/Software
[ino-project]: http://inotool.org/quickstart
