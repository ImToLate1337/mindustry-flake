# Mindustry Nix Flake

A minimal Nix flake for running the open-source game **Mindustry** directly from GitHub.

This repository provides two flake apps:

- `default` — launches the Mindustry game client
- `server` — launches the dedicated Mindustry server

## Run the game

```
nix run github:ImToLate1337/mindustry-flake
```

## Run the dedicated server

```
nix run github:ImToLate1337/mindustry-flake#server
```

After the server starts, you can type commands into the Mindustry server console.

To see available commands:

```
help
```

To list maps:

```
maps all
```

To host a PvP game:

```
host <mapname> pvp
```

Example:

```
host Fortress pvp
```

To check the server status:

```
status
```

To stop the hosted game:

```
stop
```

To close the server:

```
exit
```

## NixOS usage

On NixOS, make sure flakes are enabled in your NixOS configuration.

Add this to your `configuration.nix` or your NixOS module:

```
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

Then rebuild your system:

```
sudo nixos-rebuild switch
```

After that, run the game:

```
nix run github:ImToLate1337/mindustry-flake
```

Or run the server:

```
nix run github:ImToLate1337/mindustry-flake#server
```

## Other Linux distributions

This flake can also be used on other Linux distributions, for example:

- Fedora
- Ubuntu
- Debian
- Arch Linux

You do not need to use NixOS. You only need the Nix package manager.

### Install Nix

Install Nix with the official multi-user installer:

```
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

After installation, restart your terminal or log out and back in.

### Enable flakes

Create the Nix config directory:

```
mkdir -p ~/.config/nix
```

Enable the modern Nix command and flakes:

```
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

Now test Nix:

```
nix --version
```

Then run Mindustry:

```
nix run github:ImToLate1337/mindustry-flake
```

Or run the dedicated server:

```
nix run github:ImToLate1337/mindustry-flake#server
```


