# MINDUSTRY NIX FLAKE

### Launch Mindustry and its dedicated server directly from GitHub using Nix.

![Nix](https://img.shields.io/badge/Made%20with-Nix-5277C3?style=for-the-badge&logo=nixos&logoColor=white)  
![Mindustry](https://img.shields.io/badge/Game-Mindustry-f5a623?style=for-the-badge)  
![Linux](https://img.shields.io/badge/Platform-Linux-333333?style=for-the-badge&logo=linux&logoColor=white)  
![Status](https://img.shields.io/badge/Status-Working-brightgreen?style=for-the-badge)

---

# ABOUT

**Mindustry Nix Flake** is a small flake wrapper for the open-source game **Mindustry**.

This repository does not contain the full game source code.  
Instead, it uses **Nixpkgs** to provide reproducible commands for launching:

- the Mindustry game client
    
- the Mindustry dedicated server
    

The goal is simple:

```bash
nix run github:ImToLate1337/mindustry-flake
```

No manual package install.  
No searching for the right server jar.  
Just run it with Nix.

---

# RUN

## Launch the game client

```bash
nix run github:ImToLate1337/mindustry-flake
```

This is the same as:

```bash
nix run github:ImToLate1337/mindustry-flake#default
```

---

## Launch the dedicated server

```bash
nix run github:ImToLate1337/mindustry-flake#server
```

After the server starts, you can type Mindustry server commands directly into the terminal.

---

# SERVER QUICK START

Inside the Mindustry server console, list maps with:

```text
maps all
```

Start a PvP server with:

```text
host <mapname> pvp
```

Example:

```text
host Fortress pvp
```

Check server status:

```text
status
```

Show connected players:

```text
players
```

Stop the current game:

```text
stop
```

Exit the server:

```text
exit
```

---

# NIXOS SETUP

On NixOS, flakes need to be enabled.

Add this to your `configuration.nix` or your NixOS module:

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

Then rebuild:

```bash
sudo nixos-rebuild switch
```

Now run the game:

```bash
nix run github:ImToLate1337/mindustry-flake
```

Or run the server:

```bash
nix run github:ImToLate1337/mindustry-flake#server
```

---

# OTHER LINUX DISTROS

This flake also works on non-NixOS Linux distributions, as long as Nix is installed.

Examples:

- Fedora
    
- Ubuntu
    
- Debian
    
- Arch Linux
    
- openSUSE
    

## Install Nix

Use the official multi-user Nix installer:

```bash
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

After installation, restart your terminal or log out and back in.

## Enable flakes

Create the Nix config directory:

```bash
mkdir -p ~/.config/nix
```

Enable flakes:

```bash
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

Test Nix:

```bash
nix --version
```

Then run Mindustry with nixGL:

```bash
nix run --impure github:ImToLate1337/mindustry-flake#nixgl
```

The --impure flag is needed because nixGL has to detect and use the graphics drivers from the host Linux system.

Or run the dedicated server:

```bash
nix run github:ImToLate1337/mindustry-flake#server
```
