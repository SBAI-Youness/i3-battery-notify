# i3-battery-notify

A simple Bash script that sends a critical desktop notification when your battery drops below 20% while discharging. Built for minimal Linux setups like i3wm where no power daemon is running.

---

## Requirements

- Linux with a battery at `/sys/class/power_supply/BAT0/`
- `notify-send` - usually provided by `libnotify`

> To check your battery path: `ls /sys/class/power_supply/`  
> If it shows `BAT1`, update the path in the script accordingly.

---

## Installation

```bash
git clone https://github.com/yourusername/i3-battery-notify.git
cd i3-battery-notify
chmod +x battery-notify.sh
```

---

## Usage

Run manually to test:

```bash
./battery-notify.sh
```

### Automate with cron

To run the check every 2 minutes automatically:

```bash
crontab -e
```

Add this line:

```
*/2 * * * * /path/to/battery-notify.sh
```

Cron runs independently of your i3 session, so it works reliably across reloads and restarts.

---

## Customization

Change the threshold in `battery-notify.sh`:

```bash
if [[ "$STATUS" != "Charging" && "$CAPACITY" -lt 20 ]]; then
```

Replace `20` with whatever percentage you prefer.

---

## License

MIT - see [LICENSE](LICENSE) for details.
