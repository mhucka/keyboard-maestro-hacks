-- Summary: Given a tag name, toggle that tag in all selected tasks.
--
-- This assumes it is called by a Keyboard Maestro macro after the user selects
-- tasks in OmniFocus. Prior to calling this script, the KM macro has to set
-- a variable named "TagName" to the name of the tag to be toggled. The tag
-- has to exist in the user's OmniFocus database.
--
-- Copyright 2024 Michael Hucka.
-- License: MIT license – see file "LICENSE" in the project website.
-- Website: https://github.com/mhucka/keyboard-maestro-hacks

use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- Config variables ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- The name of the variable in Keyboard Maestro holding the tag name.
property km_variable_name: "TagName"

-- Helper functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Remove the tag if it's found on the tag; otherwise, add the tag.
on toggle_tag(_task, _tag)
	tell application "OmniFocus"
		set tag_id to id of _tag
		repeat with existing_tag in tags of _task
			if (id of existing_tag) = tag_id then
				remove _tag from tags of _task
				return
			end if
		end repeat
		-- If we didn't find the tag, add it.
		add _tag to tags of _task
	end tell
end toggle_tag

-- Main body ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- First, get the name of the tag from the KM macro that invoked this script.
-- This code is based on https://wiki.keyboardmaestro.com/AppleScript
tell application "Keyboard Maestro Engine"
	try
		set tag_name to getvariable km_variable_name
	on error msg number err
		if (err = -10006) then		   --- KM Variable Does NOT Exist ---
			display alert "Keyboard Maestro error" message msg as warning
		end if
		return err
	end try
end tell

tell application "OmniFocus"
	-- Get the actual tag object for the named tag.
	tell front document
		set tag_id to id of item 1 of (complete tag_name as tag)
		set the_tag to first flattened tag whose id is tag_id
	end tell
	
	-- Iterate over the selected items. Portions of this are based on code
	-- in a 2018-10-24 posting from user "zdiamond" to Automators.fm at
	-- https://talk.automators.fm/t/omnifocus-automate-adding-tags-to-existing-tasks/2774/5
	tell content of first document window of front document
		set selected_trees to (selected trees where ¬
			class of its value is not item ¬
			and class of its value is not folder)
		repeat with _tree in selected_trees
			set _task to value of _tree
			my toggle_tag(_task, the_tag)
		end repeat
	end tell
end tell
