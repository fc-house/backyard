# steam local server

Test backyard steam services locally.

#### requisites

- [steam account](https://store.steampowered.com/join/)
- [steam cmd](https://developer.valvesoftware.com/wiki/SteamCMD) (on path)

> :bulb: tip for powershell users: the [steam ps module](https://github.com/hjorslev/SteamPS) can be used instead of the steam cmd binary

#### set up

enter steam cmd REPL

```bash
steamcmd
```

log in with an account or use anon

```bash
login anonymous
```

associate an installation directory if you have not already. **add this directory to your path**
```bash
force_install_dir ./steam-cmd-install
```
#### pull latest

use the steam cmd to install the dedicated server tooling. use the [steamdb](https://steamdb.info/search/?a=app&q=server) tool to get the app id required
```bash
app_update <APP_ID>
```


#### scratch...

- Dedicated server list for steam
  - https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
  - https://steamdb.info/search/?a=app&q=server