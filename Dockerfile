FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    grub-pc-bin grub-efi-bin grub-common grub-mkrescue xorriso squashfs-tools \
    debootstrap \
    sudo \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
COPY . /workspace

CMD ["bash"]
