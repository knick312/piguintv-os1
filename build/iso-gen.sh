#!/bin/bash
set -e
echo "Generando ISO booteable de Piguintv OS..."
STAGING="../staging_rootfs"
OUTPUT="../output"
KERNEL="../base/kernel"
BOOTLOADER="../base/bootloader"
ROOTFS="../base/rootfs"
mkdir -p "$STAGING/boot/grub" "$STAGING/live" "$OUTPUT"
cp "$KERNEL/vmlinuz" "$STAGING/boot/vmlinuz"
cp "$KERNEL/initrd.img" "$STAGING/boot/initrd.img"
mksquashfs "$ROOTFS" "$STAGING/live/filesystem.squashfs" -comp xz -noappend
cp "$BOOTLOADER/grub.cfg" "$STAGING/boot/grub/grub.cfg"
grub-mkrescue -o "$OUTPUT/piguintv-os.iso" "$STAGING"
echo "ISO creada en $OUTPUT/piguintv-os.iso"
