#!/usr/bin/env bash

stack build --executable-profiling --library-profiling --ghc-options="-fprof-auto -rtsopts"
