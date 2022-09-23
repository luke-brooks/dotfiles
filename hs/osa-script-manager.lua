

force_paste_script = [[
	tell application "System Events" to key code 9 using command down
]]

-- emailScript = [[
-- tell application "Mail"
	
-- 	set theFrom to "sdfsdf@asdfasdf.com"
-- 	set theTos to {"asdfasdf@asdf.com"}
-- 	set theCcs to {}
-- 	set theBccs to {}
	
-- 	set theSubject to "hs email test"
-- 	set theContent to "hi dustin"
-- 	set theSignature to ""
-- 	set theAttachments to {}
-- 	set theDelay to 1
	
-- 	set theMessage to make new outgoing message with properties {sender:theFrom, subject:theSubject, content:theContent, visible:false}
-- 	tell theMessage
-- 		repeat with theTo in theTos
-- 			make new recipient at end of to recipients with properties {address:theTo}
-- 		end repeat
-- 		repeat with theCc in theCcs
-- 			make new cc recipient at end of cc recipients with properties {address:theCc}
-- 		end repeat
-- 		repeat with theBcc in theBccs
-- 			make new bcc recipient at end of bcc recipients with properties {address:theBcc}
-- 		end repeat
-- 		repeat with theAttachment in theAttachments
-- 			make new attachment with properties {file name:theAttachment as alias} at after last paragraph
-- 			delay theDelay
-- 		end repeat
-- 	end tell
	
-- 	# macOS 10.12+ know bug
-- 	# https://stackoverflow.com/questions/39860859/setting-message-signature-of-outgoing-message-using-applescript
-- 	# set message signature of theMessage to signature theSignature
	
-- 	send theMessage
	
-- end tell
-- ]]
-- print('sending email yo')
-- hs.osascript.applescript(emailScript)