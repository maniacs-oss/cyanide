#!/bin/sh

repo='http://repo.merproject.org/obs/home:/krobelus/sailfish_latest_armv7hl/armv7hl/'

rm -rf res
mkdir  res
cd     res

which wget || ( echo "wget not found"; exit 1 ) >/dev/null
which rpm2cpio || ( echo "rpm2cpio not found"; exit 1 ) >/dev/null
which bsdtar || ( echo "bsdtar not found"; exit 1 ) >/dev/null

rpmextract() {
    rpm2cpio "$1" | bsdtar -xf -
}

cat << EOF | while read package; do wget $repo$package; done
filter_audio-15.0211-10.8.1.jolla.armv7hl.rpm
filter_audio-devel-15.0211-10.8.1.jolla.armv7hl.rpm
libsodium-1.0.2-10.18.1.jolla.armv7hl.rpm
libsodium-devel-1.0.2-10.18.1.jolla.armv7hl.rpm
libv4l-1.6.2-10.29.1.jolla.armv7hl.rpm
libv4l-devel-1.6.2-10.29.1.jolla.armv7hl.rpm
libvpx-1.3.0-10.20.1.jolla.armv7hl.rpm
libvpx-devel-1.3.0-10.20.1.jolla.armv7hl.rpm
libvpx-utils-1.3.0-10.20.1.jolla.armv7hl.rpm
opus-1.1-10.5.1.jolla.armv7hl.rpm
opus-devel-1.1-10.5.1.jolla.armv7hl.rpm
toxcore-15.0303-10.3.1.jolla.armv7hl.rpm
toxcore-devel-15.0303-10.3.1.jolla.armv7hl.rpm
EOF

for package in *.rpm; do
    rpmextract "$package"
done