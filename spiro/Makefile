#
# Compile and install spiro
#

include ../common.mak

.PHONY: all clean

all:
	tar xzvf ../pkg/libspiro-*.tar.gz
	mv libspiro-* libspiro
	cd libspiro && \
		emconfigure ./configure --disable-shared --enable-static \
			--prefix=$(IPEDEPS) && \
		emmake make && \
		emmake make install
	rm $(IPEDEPS)/lib/libspiro*.la
	rm -fr $(IPEDEPS)/share

clean:
	rm -fr libspiro
