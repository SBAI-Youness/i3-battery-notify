# i3 Battery Notify

Simple Bash script that sends a **desktop notification when battery is
low**.

Designed for **minimal Linux setups** like **i3wm** where no battery
daemon is running.

The script checks battery level every **2 minutes** and sends a
**critical notification** when it drops below **20% while discharging**.

------------------------------------------------------------------------

## Features

-   Lightweight (pure Bash)
-   No background services needed
-   Works with `notify-send`
-   Prevents repeated notification spam

------------------------------------------------------------------------

## Requirements

-   Linux
-   `notify-send` (usually from `libnotify`)
-   Battery exposed at:


```
    /sys/class/power_supply/BAT0/
```
Check with:
```
    ls /sys/class/power_supply/
```
------------------------------------------------------------------------

## Installation

Clone the repository:
```
    git clone https://github.com/yourusername/i3-battery-notify.git
    cd i3-battery-notify
```
Make the script executable:
```
    chmod +x battery-notify.sh
```
------------------------------------------------------------------------

## Usage

Run the script:
```
    ./battery-notify.sh
```
To start automatically with **i3**, add to your `~/.config/i3/config`:
```
    exec --no-startup-id ~/path/to/battery-notify.sh
```
------------------------------------------------------------------------

## How it Works

The script:

1.  Reads battery percentage from:
```
/sys/class/power_supply/BAT0/capacity
```
2.  Reads battery status from:
```
/sys/class/power_supply/BAT0/status
```
3.  If:
```
battery < 20%
AND
status = Discharging
```
it sends a **critical notification** using `notify-send`.

A flag prevents repeated notifications until the battery rises above the
threshold or the charger is plugged in.

------------------------------------------------------------------------

## Customization

Change the **battery threshold**:
```
if [ "$BAT" -lt 20 ]
```
Example for 15%:
```
if [ "$BAT" -lt 15 ]
```
Change the **check interval**:
```
sleep 120
```
Example for checking every minute:
```
sleep 60
```
------------------------------------------------------------------------

## License

This project is licensed under the MIT License.

See the [LICENSE](LICENSE) file for details.
