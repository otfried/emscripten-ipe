#
# Compile and install cairo
#

include ../common.mak

.PHONY: all clean

all:
	tar xJvf ../pkg/cairo-*.tar.xz
	mv cairo-* cairo
	sed -i '/#include "cairo-deprecated.h"/d' cairo/src/cairo.h
	cd cairo && \
		export PKG_CONFIG_LIBDIR=$(IPEDEPS)/lib/pkgconfig && \
		export CFLAGS="-s USE_PTHREADS $(CFLAGS)" && \
		export LDFLAGS="-lpthread $(LDFLAGS)" && \
		meson setup build --buildtype=release --prefix=$(IPEDEPS) \
			--cross-file=$(MESON_CROSS) --default-library=static \
			-Dfontconfig=disabled -Dglib=disabled -Ddwrite=disabled \
			-Dfreetype=enabled -Dpng=enabled -Dtests=disabled --wrap-mode=nofallback && \
		meson install -C build
	rm $(IPEDEPS)/lib/libcairo-script-interpreter.*
	rm $(IPEDEPS)/lib/pkgconfig/cairo-*.pc

clean:
	rm -fr cairo
