# direct-rocksdb

[![CircleCI](https://circleci.com/gh/TerrorJack/direct-rocksdb/tree/master.svg?style=shield)](https://circleci.com/gh/TerrorJack/direct-rocksdb/tree/master)
[![AppVeyor](https://ci.appveyor.com/api/projects/status/github/TerrorJack/direct-rocksdb?branch=master&svg=true)](https://ci.appveyor.com/project/TerrorJack/direct-rocksdb?branch=master)

Bindings to [RocksDB](https://github.com/facebook/rocksdb).

## Dependencies

This package builds RocksDB in place by default. This requires:

* [`cmake`](https://cmake.org/)
* [`ninja`](http://ninja-build.org/)
* `awk`

To link with system-wide RocksDB, use the `system-rocksdb` Cabal flag.

## Windows support

Not working at the moment (builds but crashes when built with mingw-w64 toolchain). May switch to MSVC to fix it.
