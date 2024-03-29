# PerforceServer
This is a docker container for running Helix Core (a Perforce Server)


# Getting Started

Copy and rename the `p4d.env.template` file to just `.env` and set any enviornment variables you want in there.

Once that is complete, the following command to run the container initalization:

```
docker-compose up
```
This will create all the config files for the perforce server in it's /etc/ directories.

Verify that the output is correct, and stop the container with `ctrl + c`

Now you can run it in headless mode and it should "just work"

```
docker-compose up -d
```

## Firewall

Make sure to allow the perforce port that you set (`P4PORT`) through your server's firewall. For example: 

```
sudo ufw allow 1666 comment "For the perforce server!"
```

## Adding new users

Once the server is up and running, you can connect to it via [P4V](https://www.perforce.com/downloads/helix-visual-client-p4v). Here you can add users via the "Tools > Administration" panel


## Configuring your server

To get started using the perforce server for something like a game engine, you probably want to change the type map. A good one for Unreal is: 

```
Typemap:
    binary+w //....exe
    binary+w //....dll
    binary+w //....lib
    binary+w //....app
    binary+w //....dylib
    binary+w //....stub
    binary+w //....ipa
    binary+l //....uasset
    binary+l //....umap
    binary+l //....upk
    binary+l //....udk
    binary+l //....ubulk
    binary+wS //..._BuiltData.uasset
```

See https://www.perforce.com/products/helix-core/configure-helix-core-game-engine#tab-panel-76008 for more.
