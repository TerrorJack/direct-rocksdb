# direct-rocksdb

[![CircleCI](https://circleci.com/gh/TerrorJack/direct-rocksdb/tree/master.svg?style=shield)](https://circleci.com/gh/TerrorJack/direct-rocksdb/tree/master)
[![AppVeyor](https://ci.appveyor.com/api/projects/status/github/TerrorJack/direct-rocksdb?branch=master&svg=true)](https://ci.appveyor.com/project/TerrorJack/direct-rocksdb?branch=master)

Bindings to [RocksDB](https://github.com/facebook/rocksdb).

## Building

This package builds RocksDB in place by default. This requires:

* [`cmake`](https://cmake.org/)
* [`ninja`](http://ninja-build.org/)
* `awk`

You can use the `NINJA_J` environment variable to control the number of threads used by `ninja`, e.g. `NINJA_J=2`. This is a hack for building on CI, since `ninja` seems to fail to detect the actual number of CPU cores available.

To skip building and link with system-wide RocksDB, use the `system-rocksdb` Cabal flag. This is not recommended, since this package is only developed with the latest release of RocksDB.

## Windows support

Not working at the moment (builds but crashes when built with mingw-w64 toolchain). May switch to MSVC to fix it.
