# emscripten-ipe

Build the dependencies for Ipe in wasm.

Clone this repository:
```
git clone https://github.com/otfried/emscripten-ipe.git
```

Setup the emscripten environment:
```
source emsdk/emsdk_env.sh
```

Then compile all libraries one by one:
```
make setup
make libpng
make freetype
make pixman
make cairo
make lua
make spiro
make gsl
#make qhull
```

Archive the libraries and store them safely.
```
tar czvf emscripten.tar.gz emscripten
```

## Notes

* https://mesonbuild.com/Cross-compilation.html

* In the cross file, `pkgconfig` variable does not have a hyphen

