#!/bin/bash
set -e

echo "[+] Cleaning up build artifacts..."

# Remove built binaries and intermediate files
make clean || true

# Clean autotools-generated files
rm -f aclocal.m4 configure config.log config.status Makefile Makefile.in
rm -rf autom4te.cache depcomp install-sh missing compile INSTALL

# Clean generated Makefiles and dependency files
rm -f man/Makefile man/Makefile.in
rm -f src/Makefile src/Makefile.in
rm -rf src/.deps man/.deps

# Clean Debian build outputs
rm -f ../alsacap_*.deb ../alsacap-dbgsym_*.deb ../*.buildinfo ../*.changes

# Clean Debian staging area
rm -rf debian/alsacap
rm -f debian/*.substvars debian/autoreconf.* debian/debhelper-build-stamp debian/files

# Remove Docker staging area
rm -rf build/alsacap

# Remove per-arch output
rm -rf out/*

echo "[✓] Cleanup complete."
