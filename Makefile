all: clean build

validate:
	packer validate nextcloud-build-vmware.json

build: validate
	PACKER_LOG=1 packer build nextcloud-build-vmware.json
clean:
	rm -rf output-*
	rm -rf *.box

clean-all: clean
	rm -rf packer_cache
