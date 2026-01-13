```
Option                                   Description
------                                   -----------
--accept-early-plugins                   You acknowledge that loading early
                                           plugins is unsupported and may cause
                                           stability issues.
--allow-op
--assets <Path>                          Asset directory (default: ..
                                           /HytaleAssets)
--auth-mode                              Authentication mode (default:
  <authenticated|offline|insecure>         AUTHENTICATED)
-b, --bind <InetSocketAddress>           Port to listen on (default: 0.0.0.0/0.
                                           0.0.0:5520)
--backup
--backup-dir <Path>
--backup-frequency <Integer>             (default: 30)
--backup-max-count <Integer>             (default: 5)
--bare                                   Runs the server bare. For example
                                           without loading worlds, binding to
                                           ports or creating directories.
                                           (Note: Plugins will still be loaded
                                           which may not respect this flag)
--boot-command <String>                  Runs command on boot. If multiple
                                           commands are provided they are
                                           executed synchronously in order.
--client-pid <Integer>
--disable-asset-compare
--disable-cpb-build                      Disables building of compact prefab
                                           buffers
--disable-file-watcher
--disable-sentry
--early-plugins <Path>                   Additional early plugin directories to
                                           load from
--event-debug
--force-network-flush <Boolean>          (default: true)
--generate-schema                        Causes the server generate schema,
                                           save it into the assets directory
                                           and then exit
--help                                   Print's this message.
--identity-token <String>                Identity token (JWT)
--log <KeyValueHolder>                   Sets the logger level.
--migrate-worlds <String>                Worlds to migrate
--migrations <Object2ObjectOpenHashMap>  The migrations to run
--mods <Path>                            Additional mods directories
--owner-name <String>
--owner-uuid <UUID>
--prefab-cache <Path>                    Prefab cache directory for immutable
                                           assets
--session-token <String>                 Session token for Session Service API
--shutdown-after-validate                Automatically shutdown the server
                                           after asset and/or prefab validation.
--singleplayer
-t, --transport <TransportType>          Transport type (default: QUIC)
--universe <Path>
--validate-assets                        Causes the server to exit with an
                                           error code if any assets are invalid.
--validate-prefabs [ValidationOption]    Causes the server to exit with an
                                           error code if any prefabs are
                                           invalid.
--validate-world-gen                     Causes the server to exit with an
                                           error code if default world gen is
                                           invalid.
--version                                Prints version information.
--world-gen <Path>                       World gen directory
```