#!/usr/bin/env bash

MACHINE=$1

WORKDIR="$BINARIES_DIR/install"
BOARDDIR="$BR2_EXTERNAL_TORADEX_PATH/board"

FILES=" \
	$BINARIES_DIR/SPL \
	$BINARIES_DIR/u-boot.* \
	$BINARIES_DIR/rootfs.tar \
	$BOARDDIR/common/buildroot.png \
	$BOARDDIR/common/marketing.tar \
	$BOARDDIR/$MACHINE/image.json \
	$BOARDDIR/$MACHINE/uEnv.txt \
	"

# create work directory
rm -rf $WORKDIR && mkdir -p $WORKDIR

# copy files
cp $FILES $WORKDIR

# prepare and copy kernel files
cd $BINARIES_DIR && \
	rm -rf kernel.tar && \
	tar cf kernel.tar *.dtb zImage && \
	mv kernel.tar $WORKDIR/ && \
	cd - >/dev/null

# create tezi image
cd $BINARIES_DIR && \
	rm -rf install.tar && \
	tar cf install.tar install && \
	rm -rf install && \
	cd - >/dev/null

echo "TEZI image successfully generated!"
