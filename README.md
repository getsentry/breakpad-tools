# Breakpad Tools

Builds Breakpad and creates artifacts on different operating systems. To use it,
clone on a compatible system, go to the folder of the respective operating
system, and run `make all` or run one of the targets below:

```sh
git clone --recursive https://github.com/getsentry/breakpad-tools
cd breakpad-tools/linux && make all
```

**Libraries**

* `libclient.a`: Static library containing the breakpad `ExceptionHandler`<br>
  _target: `make client`_

**Tools**

* `dump_syms`: A tool to create breakpad symbols<br>
  _target: `make dump_syms`_
* `minidump_stackwalk`: A tool to process minidumps<br>
  _target: `make minidump_stackwalk`_

**Examples**

* `crash`: A program that crashes and generates a minidump<br>
  _target: `make crash`_
* `crash.sym`: Breakpad symbols for the crashing program<br>
  _target: `make symbols`_
* `mini.dmp`: A crash dump of the `crash` executable<br>
  _target: `make minidump`_

## Download

The latest builds can always be downloaded here:

* [Download linux archive](https://s3.amazonaws.com/getsentry-builds/getsentry/breakpad-tools/breakpad-tools-linux.zip)
* [Download macOS archive](https://s3.amazonaws.com/getsentry-builds/getsentry/breakpad-tools/breakpad-tools-macos.zip)

_**Please note** that the examples are always built from scratch, so UUIDs will
change!_

## Build Process

The breakpad libraries and tools are built with custom makefiles. Each OS folder
contains a slightly different version customized to the platform. Breakpad has
broken their own build files (especially on macOS) quite frequently, so this is
the most stable approach.

The breakpad submodule has been updated last on `2017-12-22`. Future updates
might require changes to the makefiles.
