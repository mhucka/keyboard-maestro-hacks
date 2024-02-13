# Summary: copy the URLs of the tabs in the frontmost Safari window.
#
# Amazingly short code due in part to studying the 2021-02-17 posting by user
# "nisetama" to Apple.SE at https://apple.stackexchange.com/a/413790/6489
#
# Copyright 2024 Michael Hucka.
# License: MIT license – see file "LICENSE" in the project website.
# Website: https://github.com/mhucka/keyboard-maestro-hacks

use AppleScript version "2.5"
use scripting additions

# Need to set this outside of Safari or you'll get an error.
set text item delimiters to linefeed

tell application "Safari"
	set urls to (url of every tab of front window) as text
	set the clipboard to the text of urls
end tell
