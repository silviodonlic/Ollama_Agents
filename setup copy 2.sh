sudo apt purge pipewire jackd2
sudo apt install pipewire pipewire-audio-client-libraries pipewire-jack jackd2 alsa-base alsa-utils

systemctl --user status pipewire
systemctl --user status pipewire-pulse
systemctl --user status jack

sudo apt --fix-broken install


Create pipewire.conf:

bash

sudo nano /etc/pipewire/pipewire.conf

Add the following content to the file:

ini

context.modules = [
  { name = libpipewire-module-protocol-native }
  { name = libpipewire-module-protocol-pulse }
  { name = libpipewire-module-jack }
]

Save and exit (Ctrl+X, Y, Enter).

Create pipewire-pulse.conf:

bash

sudo nano /etc/pipewire/pipewire-pulse.conf

Add the following content to the file:

ini

context.modules = [
  { name = libpipewire-module-protocol-pulse }
  { name = libpipewire-module-pulse-device }
]

Save and exit (Ctrl+X, Y, Enter).

Restart PipeWire Services:

bash

systemctl --user restart pipewire
systemctl --user restart pipewire-pulse

