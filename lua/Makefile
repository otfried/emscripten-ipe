#
# Compile and install lua
#

include ../common.mak

.PHONY: all clean

all:
	tar xzvf ../pkg/lua-*.tar.gz
	mv lua-* lua
	cd lua && make CC=emcc
	cp lua/src/liblua.a $(IPEDEPS)/lib
	mkdir -p $(IPEDEPS)/include/lua
	cd lua/src && cp lua.h luaconf.h lualib.h lauxlib.h $(IPEDEPS)/include/lua

clean:
	rm -fr lua
