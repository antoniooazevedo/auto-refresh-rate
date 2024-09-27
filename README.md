# auto-refresh-rate

Shell script to automatically change the refresh rate of the monitor based on it's charging state:
 - Plugged in -> 120hz
 - Unplugged -> 60hz

We get the AC power status by checking the contents of `/sys/class/power_supply/AC0/online` using the `cat` command
 - 0 -> Unplugged
 - 1 -> Plugged in
