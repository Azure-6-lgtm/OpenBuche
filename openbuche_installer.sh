#!/bin/bash

# Set up repository URL or local path for Arch v1.0 tar.gz
ARCH_TAR_URL="https://path/to/arch-v1.0.tar.gz"
DEST_DIR="$HOME/openbuche"  # Install directory within the user's home

# Welcome message
echo "Welcome to the OpenBuche Installer!"

# Step 1: Create the destination directory
echo "Creating installation directory: $DEST_DIR"
mkdir -p "$DEST_DIR"

# Step 2: Download the Arch v1.0 tar.gz
echo "Downloading Arch v1.0 tar.gz from $ARCH_TAR_URL"
wget -q "$ARCH_TAR_URL" -O "$DEST_DIR/arch-v1.0.tar.gz"

# Step 3: Extract the tar.gz file
echo "Extracting tar.gz..."
tar -xvzf "$DEST_DIR/arch-v1.0.tar.gz" -C "$DEST_DIR"

# Step 4: Set up OpenBuche system (customize setup if needed)
echo "Setting up OpenBuche..."

# Create a basic Proot command to chroot into the Arch environment
PROOT_CMD="proot --link2symlink -0 -r $DEST_DIR -b /dev -b /proc -b /sys -b /tmp -b $HOME:$HOME /bin/bash"

# Step 5: Running Proot environment
echo "Entering the OpenBuche Arch environment with Proot..."
$PROOT_CMD

# Final message
echo "OpenBuche installation complete!"
echo "You can now use Proot to interact with your Arch environment."