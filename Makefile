#
# Makefile for building the dependencies of Ipe in emscripten/wasm
#

IPEDEPS = $(shell pwd)/emscripten

subdirs = \
	libpng \
	freetype \
	pixman \
	cairo \
	lua \
	spiro \
	gsl
# qhull \

.PHONY: download setup $(subdirs)

all: $(subdirs)

download:
	$(MAKE) --directory=pkg $(GOAL)

setup:
	mkdir -p $(IPEDEPS)/bin
	mkdir -p $(IPEDEPS)/lib
	mkdir -p $(IPEDEPS)/include
	embuilder build zlib
	embuilder build libjpeg

$(subdirs):
	$(MAKE) --directory=$@ $(GOAL)

clean:
	rm -fr $(IPEDEPS)
	$(MAKE)	GOAL=clean
