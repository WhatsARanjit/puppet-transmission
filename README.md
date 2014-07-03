# Transmission-Daemon Module

## Overview

This will setup and install Transmission-Daemon.

## Capabilities

Installalation includes:

- Transmission source code
- Transmission CLI
- Transmission Daemon
- Transmission GTK

Requires:

- *nix operating system
- Nanliu/staging module to stage install binaries

## Transmission parameters
See transmission documentation for variable definitions.<br />
https://trac.transmissionbt.com/wiki/EditConfigFiles. Note: Variable names replace dashes with underscores.  For example, to set `alt-speed-down`, pass parameter `alt_speed_down`.

* `transd`<br />
Default: /var/lib/transmission
* `transuser`<br />
Default: transmission
* `transgroup`<br />
Default: transmission

## Example Usage

Install transmission:

```puppet
include transmission
```

Install transmission with custom parameters:

```puppet
class { 'transmission':
  rpc-enabled  => true,
  rpc-password => '{5bf3cd57109da5468fe6519c4ead6f281fbacff8W366dVGr',
  rpc-port     => '9090',
}
```

## TODO
The transmission-daemon overwrites a plaintext password in settings.json with a hashed version.  The hash function they use is custom.  For now, you must use the hash password in your parameters to prevent a constant conflict between the Puppet agent and the transmission-daemon.  I will need to add a custom function to mimic the function in transmission to hash the password.
