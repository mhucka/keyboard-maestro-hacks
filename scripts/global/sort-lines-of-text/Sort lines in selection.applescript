
# Summary: replaces currently-selected text with a version with lines sorted
#
# Copyright 2024 Michael Hucka.
# License: MIT license – see file "LICENSE" in the project website.
# Website: https://github.com/mhucka/keyboard-maestro-hacks

use AppleScript version "2.5"
use framework "Foundation"
use scripting additions

# ~~~~ Config variables ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

property code_editors: {"Script Editor", "AppleScript Editor", ¬
						"Script Debugger", "Emacs"}

# ~~~~ Helper function ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Return the given file name without its file name extension, if any.
on remove_ext(file_name)
	script wrapperScript
		property ca: a reference to current application
		use framework "Foundation"
		on remove_ext(file_name)
			set u to ca's NSURL's fileURLWithPath:file_name
			return u's URLByDeletingPathExtension()'s lastPathComponent() as text
		end remove_ext
	end script
	return wrapperScript's remove_ext(file_name)
end remove_ext

# Return the file name of this script as a string, minus the extension.
on get_script_name()
    tell application "System Events"
        set path_alias to path to me
		set file_name to name of path_alias
		return my remove_ext(file_name)
    end tell
end get_script_name

# Sort text lines alphabetically.
on sort_text_lines(input_text)
	script wrapperScript
		property ca: a reference to current application
		use framework "Foundation"
		on sort_text_lines(input_text)
			set text_lines to paragraphs of input_text
			set sorted_lines to ca's NSArray's arrayWithArray:text_lines
			set sorted_array to sorted_lines's ¬
				sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"
			return (sorted_array as list) as text
		end sort_text_lines
	end script
	return wrapperScript's sort_text_lines(input_text)
end sort_text_lines

-- Remove leading and trailing whitespace from the text and return the result.
on trim(raw_text)
	script wrapperScript
		property ca: a reference to current application
		use framework "Foundation"
		on trim(raw_text)
			set str to ca's NSString's stringWithString:raw_text
			set whsp to ca's NSCharacterSet's whitespaceAndNewlineCharacterSet()
			return (str's stringByTrimmingCharactersInSet:whsp) as text
		end trim
	end script
	return wrapperScript's trim(raw_text)
end trim

# ~~~~ Main body ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tell application "System Events"
    set front_proc to first application process whose frontmost is true
	if name of front_proc is in code_editors then
		set visible of front_proc to false
		repeat while (front_proc is frontmost)
			delay 0.1
		end repeat
		set current_app to name of first process where it is frontmost
		set frontmost of front_proc to true
	else
		set current_app to name of front_proc
	end if
end tell

if current_app is "System Events" then
    display dialog "Please select some text in an editable application." ¬
		with title my get_script_name() ¬
		with icon 0 buttons {"OK"} default button "OK" ¬
		giving up after 10
    return
end if

tell application current_app
	activate
end tell

set old_delims to AppleScript's text item delimiters
set AppleScript's text item delimiters to {ASCII character 10}

# Copy the text highlighted in the current application. I couldn't find a more
# direct way of doing this than to use GUI scripting.
tell application "System Events"
	try
		set the clipboard to ""
		keystroke "c" using command down
		delay 0.5
		set selected_text to (Unicode text of (get the clipboard as record))
	on error 
		display dialog "Unable to copy selected text from " & current_app ¬
			with title my get_script_name() ¬
			with icon 0 buttons {"OK"} default button "OK" ¬
			giving up after 10
	end try

	if selected_text is "" then
		display dialog "No text selected – nothing to do." ¬
			with title my get_script_name() ¬
			with icon 2 buttons {"OK"} default button "OK" ¬
			giving up after 10
		return
	end if

	set selected_text to my trim(selected_text)
	set the clipboard to my sort_text_lines(selected_text)

	try
		keystroke (the clipboard as text)
	on error 
		display dialog "Unable to paste text into " & current_app ¬
			with title my get_script_name() ¬
			with icon 0 buttons {"OK"} default button "OK" ¬
			giving up after 10
	end try
end tell
