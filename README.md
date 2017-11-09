# direct-rocksdb

[![CircleCI](https://circleci.com/gh/TerrorJack/direct-rocksdb/tree/master.svg?style=shield)](https://circleci.com/gh/TerrorJack/direct-rocksdb/tree/master)
[![Hackage](https://img.shields.io/hackage/v/direct-rocksdb.svg)](https://hackage.haskell.org/package/direct-rocksdb)
[![Stackage Nightly](https://www.stackage.org/package/direct-rocksdb/badge/nightly)](https://www.stackage.org/nightly/package/direct-rocksdb)

Bindings to [RocksDB](https://github.com/facebook/rocksdb).

## Building

This package builds RocksDB in place by default. This requires:

* [`cmake`](https://cmake.org/)
* [`ninja`](http://ninja-build.org/)
* `awk`

You can use the `NINJA_FLAGS` environment variable to pass extra flags to `ninja`, e.g. `NINJA_FLAGS=-j2`. This is a hack for building on CI, since `ninja` seems to fail to detect the actual number of CPU cores available.

To skip building and link with system-wide RocksDB, use the `system-rocksdb` Cabal flag. This is not recommended, since this package is only developed with the latest release of RocksDB.

## Using

[`Database.RocksDB.Internals`](src/Database/RocksDB/Internals.hs) contains the raw C bindings. All functions and `enum` values in [`rocksdb/c.h`](rocksdb-5.8/include/rocksdb/c.h) are covered. The opaque types like `rocksdb_t`, `rocksdb_options_t` have corresponding Haskell types like `Rocksdb`, `RocksdbOptions`. They are nullary datatypes and are only used to mark the `Ptr` phantom type.

The higher-level API is being worked on. Using functions like `marshalOptions`, `openDB`, you can obtain a `ForeignPtr` which carries a C resource. The garbage collector can automatically invokes the `ForeignPtr` finalizers, and you can also use `finalizeForeignPtr` with something like `bracket` or `ResourceT` to ensure scoped finalizing. Also, `ByteString`s are used instead of raw buffers.

Some RocksDB functions require passing in a pointer to an error message buffer for error reporting. The higher-level API will obtain the error message and throw it with a `RocksDBException` when present.

## About Windows support

Unsupported for now.
