## Realworld Haskell A
Running the program:
```
stack build
.stack-work/install/x86_64-osx/lts-7.10/8.0.1/bin/hw-tutorial-performance-rwha 1e5
.stack-work/install/x86_64-osx/lts-7.10/8.0.1/bin/hw-tutorial-performance-rwha 1e6
.stack-work/install/x86_64-osx/lts-7.10/8.0.1/bin/hw-tutorial-performance-rwha 1e7

.stack-work/install/x86_64-osx/lts-7.10/8.0.1/bin/hw-tutorial-performance-rwha +RTS -sstderr -RTS 1e7

stack build --executable-profiling --library-profiling --ghc-options="-fprof-auto -rtsopts"


stack bench
stack bench --benchmark-arguments '--output=$benchmark.html'
stack build
stack build --executable-profiling
stack build --executable-profiling --ghc-options="-O2"
stack build --executable-profiling --library-profiling
stack build --executable-profiling --library-profiling --ghc-options="-fprof-auto -rtsopts -auto-all -caf-all -fforce-recomp -ddump-asm"
stack build --executable-profiling --library-profiling --ghc-options="-fprof-auto -rtsopts -auto-all -caf-all -fforce-recomp"
stack build --executable-profiling --library-profiling --ghc-options="-fprof-auto -rtsopts -prof -auto-all -caf-all -fforce-recomp"
stack build --executable-profiling --library-profiling --ghc-options="-fprof-auto -rtsopts"
```


## Links
* [Glasgow Haskell Compiler Users Guide](http://downloads.haskell.org/~ghc/8.0.1/docs/html/users_guide/profiling.html)
* [Real World Haskell - Profiling and optimization](http://book.realworldhaskell.org/read/profiling-and-optimization.html)
