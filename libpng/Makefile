#
# Compile and install libpng
#

include ../common.mak

.PHONY: all clean

all:
	tar xzvf ../pkg/libpng-*.tar.gz
	mv libpng-* libpng
	cd libpng && \
		export PKG_CONFIG_LIBDIR=$(IPEDEPS)/lib/pkgconfig && \
		export CFLAGS="-s USE_PTHREADS" && \
		export LDFLAGS="-lz $(LDFLAGS)" && \
		emconfigure ./configure --host=${CHOST} --with-binconfigs=no \
			--prefix=$(IPEDEPS) --enable-shared=no --disable-dependency-tracking && \
		emmake make && \
		emmake make install
	rm $(IPEDEPS)/lib/libpng.a $(IPEDEPS)/lib/libpng*.la
	rm $(IPEDEPS)/include/png*.h
	rm $(IPEDEPS)/bin/pngfix $(IPEDEPS)/bin/png-fix-itxt $(IPEDEPS)/bin/libpng-config
	sed -i.bak '/^Requires.private:/d' $(IPEDEPS)/lib/pkgconfig/libpng16.pc
	rm -fr $(IPEDEPS)/share

clean:
	rm -fr libpng
