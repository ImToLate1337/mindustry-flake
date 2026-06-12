MINDUSTRY NIX FLAKE
Launch Mindustry and its dedicated server directly from GitHub using Nix.

ABOUT

Mindustry Nix Flake is a small flake wrapper for the open-source game Mindustry.

This repository does not contain the full game source code.
Instead, it uses Nixpkgs to provide reproducible commands for launching:

the Mindustry game client
the Mindustry dedicated server

The goal is simple:

nix run github:ImToLate1337/mindustry-flake

No manual package install.
No searching for the right server jar.
Just run it with Nix.

RUN
Launch the game client
nix run github:ImToLate1337/mindustry-flake

This is the same as:

nix run github:ImToLate1337/mindustry-flake#default
Launch the dedicated server
nix run github:ImToLate1337/mindustry-flake#server

After the server starts, you can type Mindustry server commands directly into the terminal.

SERVER QUICK START

Inside the Mindustry server console, list maps with:

maps all

Start a PvP server with:

host <mapname> pvp

Example:

host Fortress pvp

Check server status:

status

Show connected players:

players

Stop the current game:

stop

Exit the server:

exit
NIXOS SETUP

On NixOS, flakes need to be enabled.

Add this to your configuration.nix or your NixOS module:

nix.settings.experimental-features = [ "nix-command" "flakes" ];

Then rebuild:

sudo nixos-rebuild switch

Now run the game:

nix run github:ImToLate1337/mindustry-flake

Or run the server:

nix run github:ImToLate1337/mindustry-flake#server
OTHER LINUX DISTROS

This flake also works on non-NixOS Linux distributions, as long as Nix is installed.

Examples:

Fedora
Ubuntu
Debian
Arch Linux
openSUSE
Install Nix

Use the official multi-user Nix installer:

curl -L https://nixos.org/nix/install | sh -s -- --daemon

After installation, restart your terminal or log out and back in.

Enable flakes

Create the Nix config directory:

mkdir -p ~/.config/nix

Enable flakes:

echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

Test Nix:

nix --version

Then run Mindustry:

nix run github:ImToLate1337/mindustry-flake

Or run the dedicated server:

nix run github:ImToLate1337/mindustry-flake#server
