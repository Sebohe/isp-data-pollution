
$(shell mkdir build)

.PHONY: docker phantomjs

phantom_ver=phantomjs-2.1.1-linux-x86_64.tar.bz2
phantomjs_url=https://bitbucket.org/ariya/phantomjs/downloads/$(phantom_ver)

all: docker

build/$(phantom_ver): 
	wget $(phantomjs_url) -O build/$(phantom_ver)
	tar -xvf build/$(phantom_ver) -C build/
	touch build/$(phantom_ver)

docker: build/$(phantom_ver)
	docker build -f Dockerfile -t sebohe/isp-data-pollution .
	touch build/docker

clean:
	rm -rf build
