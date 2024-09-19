#!/bin/bash

# Create pipewire.conf
cat << EOF > /etc/pipewire/pipewire.conf
context.modules = [
  { name = libpipewire-module-client-node }
  { name = libpipewire-module-session-manager }
  { name = libpipewire-module-alsa-sink }
  { name = libpipewire-module-alsa-source }
  { name = libpipewire-module-jack }
]

context.sinks = [
  { name = "default" }
]

context.sources = [
  { name = "default" }
]
EOF

# Create pipewire-pulse.conf
cat << EOF > /etc/pipewire/pipewire-pulse.conf
context.modules = [
  { name = libpipewire-module-client-node }
  { name = libpipewire-module-session-manager }
  { name = libpipewire-module-pulse }
]
EOF

sudo apt update
sudo apt purge pipewire pipewire-audio-client-libraries pipewire-jack jackd2 alsa-base alsa-utils
sudo apt install pipewire pipewire-audio-client-libraries pipewire-jack jackd2 alsa-base alsa-utils

sudo apt install pop-de-gnome libspa-0.2-jack pipewire-alsa pipewire-pulse wireplumber
