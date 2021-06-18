export PATH := $(PATH)
build-container:
	docker build --network=host -t vmguestlib:builder .

generate-deb:
	docker run -it --net host --user $(shell id -u) -v $(shell pwd):/app vmguestlib:builder


upload-deb:
	gsutil cp deb_dist/*.deb gs://opscenter-isos/deb

cleanup:
	rm -rf deb_dist dist
	rm -rf python-vmguestlib-*.tar.gz
	rm -rf *.egg-info

build: build-container generate-deb upload-deb cleanup

