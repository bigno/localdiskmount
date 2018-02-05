# localdiskmount

Bash script for automatic mount of a local disk (USB).

### Main features
- Check if the disk is already mounted
- Check if the path where the mount will be mounted exists

### Configurations
- `DRIVE_TO_MOUNT`: This variable is an array that must contains the path of the "local drive(s)" that we desire to mount. For example, '/dev/sda1'.
- `PATH_WHERE_MOUNT`: This variable is an array that must contains the "absolute mount path(s)" that we desire to mount.
- `MOUNT_TYPE`: This variable is an array that must define the "mount type" that will be used in the `-t` option of `mount` command.

### Suggested use
The script can be used via crontab.

### Tested environment
The script has been successfully tested on the following environments:
- Raspberry Pi 3 with _**Raspbian**_ Stretch distro.
