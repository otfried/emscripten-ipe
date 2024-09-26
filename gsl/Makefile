#
# Compile and install gsl
#

# https://stackoverflow.com/a/67169806

include ../common.mak

.PHONY: all clean

all:
	tar xzvf ../pkg/gsl-*.tar.gz
	mv gsl-* gsl
	cd gsl && \
		emconfigure ./configure --disable-shared --enable-static \
			--prefix=$(IPEDEPS) CFLAGS="-g -O2" && \
		emmake make && \
		emmake make install
	rm $(IPEDEPS)/bin/gsl-histogram $(IPEDEPS)/bin/gsl-randist $(IPEDEPS)/bin/gsl-config
	rm $(IPEDEPS)/lib/libgsl*.la
	rm -fr $(IPEDEPS)/share

clean:
	rm -fr gsl
