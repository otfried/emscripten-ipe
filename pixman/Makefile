#
# Compile and install pixman
#

include ../common.mak

.PHONY: all clean

all:
	tar xzvf ../pkg/pixman-*.tar.gz
	mv pixman-*[0-9] pixman
	cd pixman && \
		export PKG_CONFIG_LIBDIR=$(IPEDEPS)/lib/pkgconfig && \
		export CFLAGS="-s USE_PTHREADS $(CFLAGS)" && \
		export LDFLAGS="-lpthread $(LDFLAGS)" && \
		meson setup _build --prefix=$(IPEDEPS) --cross-file=$(MESON_CROSS) \
			--default-library=static --buildtype=release -Dtests=disabled \
			--wrap-mode=nofallback -Dlibpng=disabled && \
		meson install -C _build
	rm -fr $(IPEDEPS)/share

clean:
	rm -fr pixman
