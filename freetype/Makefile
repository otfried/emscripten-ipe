#
# Compile and install freetype
#

include ../common.mak

.PHONY: all clean

all:
	tar xzvf ../pkg/freetype-*.tar.gz
	mv freetype-* freetype
	cd freetype && \
		export PKG_CONFIG_LIBDIR=$(IPEDEPS)/lib/pkgconfig && \
		export CFLAGS="-s USE_PTHREADS $(CFLAGS)" && \
		export LDFLAGS="-lpthread $(LDFLAGS)" && \
		meson setup build --prefix=$(IPEDEPS) --cross-file=$(MESON_CROSS) \
			--default-library=static --buildtype=release -Dtests=disabled \
			--wrap-mode=nofallback -Dpng=disabled && \
		meson install -C build
	rm -fr $(IPEDEPS)/share

clean:
	rm -fr freetype
