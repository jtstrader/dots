# [HLWM] Mountain Theme
Make sure that in installing this you have Font Awesome 5 installed, as well as Source Code Pro and inconsolata. There are certain configurations in these dot files that I have not removed that are specific to *my* system, such as the monitor setup. My monitors differing pixel densities and as such might glitch out on your machine if you're not careful. Please change the monitor configurations that are set up using xrandr at the end of my [autostart](./herbstluft/autostart) file. Also, unless you plan to edit them out, make sure you have flameshot (for screenshots) and dmenu (for running applications) installed.

The background photo is from wallhaven.cc: https://wallhaven.cc/w/0pyqke

# Color Scheme and Background
I use nitrogen to set up the background, so if you wish to use or manipulate this, you'll need to either use nitrogen or remove it from my [autostart](./herbstluft/autostart) file (one of the last lines there).

To set up the color scheme, you can either manually edit the alacritty.yml or however else you manage how your colors display, or you can use pywal and load my .json configuration that I provided. Use the command below to set up the scheme, and don't forget to replace the ellipses with your path to the .json file:

`wal --theme .../colors.json -n -b "#ffffff"`

Make sure you put the -n flag there!!! I've had some weird errors with the computer getting confused on whether or not to use pywal's background that is chooses (if you forget the -n) or nitrogen. Since I use nitrogen to set my background, I strictly use -n for all pywal commands as otherwise it might glitch out my autostart that loads up the background using nitrogen.

I hope that covers most of how to get this started! This is my second rice, so still some trial and error and definitely probably some buggy/unecessary code, but thankfully I can say that after doing some full stack development on this rice for a few days I've noticed little to no issues with it, so I'm hoping it works well!
