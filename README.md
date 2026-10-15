# flake off eh?

This is for my macOS systems only.

## initial setup:

```sh
curl -L https://nixos.org/nix/install | sh
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' > ~/.config/nix/nix.conf
```

logout/in, and then:

```sh
git clone git@github.com:plicease/nix-config.git ~/dev/nix-config
cd ~/dev/nix-config
nix profile add '.#default'
```

## updates

create new config:

```sh
nix flake update
git add flake.lock
git commit -m "Update nixpkgs"
git push
```

deploy:

```sh
cd ~/dev/nix-config
git pull
nix profile add --refresh '.#default'
```

