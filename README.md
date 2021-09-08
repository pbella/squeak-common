squeak-common
=============

# Overview

This repository contains the common files used by all Squeak VM variants (squeak-vm and opensmalltalk-vm) and the associated Debian configuration files needed for packaging.  The files included here should either be Debian (and derivatives) specific or of a general nature and applicable to all VMs.  Files and documentation specific to a particular VM implementation should be managed in the same repository as the VM itself rather than here.

# Known issues

	1. squeak-vm is temporarily listed as a Conflicts: package until we have updated squeak-vm to no longer include conflicting filenames.  (i.e. after everything is finalized with the opensmalltalk-vm package, conforming changes will be made to squeak-vm and then it will be removed from Conflicts: allowing all VM variants to co-exist)
	2. While the MIME type association works for launching an image file via a GUI file manager such as Nautilus, the image associations to display the Squeak icon for known types are currently broken.
