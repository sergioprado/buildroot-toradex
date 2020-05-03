# Intro

Buildroot BSP layer for Toradex System-on-Modules.

This is an "unofficial" BSP based on the Yocto BSP from Toradex.

# How to build

First, check if you have all mandatory host packages Buildroot needs for the compilation, as described in its manual:

https://buildroot.org/downloads/manual/manual.html#requirement

Create a directory to download all the sources:

```console
$ mkdir -p buildroot-bsp && cd buildroot-bsp
```

Clone the last stable buildroot version:

```console
$ git clone git://git.buildroot.net/buildroot -b 2020.02.1
```

Clone the Buildroot BSP layer for Toradex modules (this repository):

```console
$ git clone git@github.com:sergioprado/buildroot-toradex.git
```

Create a directory for the build:

```console
$ mkdir build && cd build
```

Initialize the build directory (example for the Apalis i.MX6 SoM):

```console
$ make O=$PWD -C $PWD/../buildroot BR2_EXTERNAL=$PWD/../buildroot-toradex apalis_imx6_defconfig
```

Substitute *apalis_imx6_defconfig* for the module you want to build. Here are the current supported modules:

* apalis_imx6_defconfig
* colibri_imx6_defconfig

Optionally, open the configuration menu to enable extra packages:

```console
$ make menuconfig
```

Now start the build:

```console
$ make
```

The build should take some time. In the end of the build, you should see the message "*TEZI image successfully generated!*".

The generated images will be available in the *images/* directory:

```console
$ ls images/
```

To install the generated image in the SoM you should use Toradex Easy Installer:

1. Extract the file *install.tar* to an SD Card.
2. Connect the sdcard to the board.
3. Follow Toradex instructions on how to load Toradex Easy Installer and install an image in the module (https://developer.toradex.com/software/toradex-easy-installer).

# More info

Any question, feature request ou bug report, please use the Issues session in this repository.
