DEB_PACKAGE=$(shell dpkg-parsechangelog --show-field Source)
DEB_VERSION=$(shell dpkg-parsechangelog --show-field Version)
DEB_BASE_VERSION=$(strip $(shell echo -n $(DEB_VERSION) | sed --expression='s/-.*//g' ) )
DEB_TARBALL=../$(DEB_PACKAGE)_$(DEB_VERSION).debian.tar.xz
ORIG_TARBALL=../$(DEB_PACKAGE)_$(DEB_BASE_VERSION).orig.tar.gz
DEBIAN_WORK=debian/files debian/squeak-common.substvars debian/$(DEB_PACKAGE)

clean:
	@file_list='$(DEBIAN_WORK)'; \
	for cur_file in $$file_list; do \
		if [ -e $$cur_file ]; then \
			echo removing work file $$cur_file; \
			rm -r $$cur_file; \
		fi \
	done

deb:
	debuild -us -uc

orig-tarball:
	@if [ -f $(ORIG_TARBALL) ]; then \
		echo removing old $(ORIG_TARBALL); \
		rm $(ORIG_TARBALL); \
	fi
	tar czf $(ORIG_TARBALL) etc usr Makefile

deb-tarball: clean
	@if [ -f $(DEB_TARBALL) ]; then \
		echo removing old $(DEB_TARBALL); \
		rm $(DEB_TARBALL); \
	fi
	tar cJf $(DEB_TARBALL) debian

source-package: orig-tarball deb-tarball
	dpkg-source -b .
