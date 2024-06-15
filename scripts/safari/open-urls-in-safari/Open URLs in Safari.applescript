-- Summary: open all selected URLs in a new window in Safari.
--
-- Copyright 2024 Michael Hucka.
-- License: MIT License – see file "LICENSE" in the project website.
-- Website: https://github.com/mhucka/Keyboard-maestro-hacks

use framework "Foundation"
use scripting additions


-- Helper functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

on openInSafari(urls)
	tell application "Safari"
		activate
		set {first_url, remaining_urls} to {item 1 of urls, rest of urls}
		make new document with properties {URL:first_url}
		tell window 1
			repeat with URL in remaining_urls
				make new tab at end of tabs with properties {URL:URL}
			end repeat
		end tell
	end tell
end openInSafari

on isURL(str)
	set ca to a reference to current application
	set parsed_url to ca's NSURLComponents's componentsWithString:(str)
	return (parsed_url ≠ missing value ¬
		and parsed_url's |scheme|() ≠ missing value ¬
		and parsed_url's |host|() ≠ missing value)
end isURL


-- Main body ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tell application "System Events"
	-- The lack of a universal way to tell any application to copy
	-- selected text to the clipboard means we have to use sucky GUI
	-- scripting.
	key code 8 using command down
	-- I get erratic clipboard contents without this delay.
	delay 0.25
	set candidates to paragraphs of (the clipboard as text)
	repeat with i from 1 to count of candidates
		set candidates's item i to (text of candidates's item i)'s text
	end repeat
	if candidates = {} then
		display alert "No text selected."
		return
	end if
	set urls to {}
	repeat with _item in candidates
		if my isURL(_item) then
			set end of urls to _item
		end if
	end repeat
	if urls = {} then
		display alert "No URLs found in selection."
		return
	end if
	my openInSafari(urls)
end tell
