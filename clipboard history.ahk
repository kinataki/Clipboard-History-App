#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetCapsLockState , Off
GUI +Disabled +AlwaysOnTop
Gui, Add, ListView , r10 -Hdr Grid, no|content
Gui, 1:Default
LV_ModifyCol(1, 30)
LV_ModifyCol(2, 370)
LV_Add("", "1", item1)
LV_Add("", "2", item2)
LV_Add("", "3", item3)
LV_Add("", "4", item4)
LV_Add("", "5", item5)
LV_Add("", "6", item6)
LV_Add("", "7", item7)
LV_Add("", "8", item8)
LV_Add("", "9", item9)

;HasVal(haystack, needle) {
	;for index, value in haystack
		;if (value = needle)
			;return True
	;if !(IsObject(haystack))
		;return false
	;return 0
;}

global item1 
global item2
global item3
global item4
global item5
global item6
global item7
global item8
global item9

onclipboardchange("Shiftone")

Shiftone(1) {
	;if any of them is equal to the clipboard, bring that one to the first item and shift every one up.
	global item1 
	global item2
	global item3
	global item4
	global item5
	global item6
	global item7
	global item8
	global item9
	
	
	
	;global itemlist := {item1: item1, item2: item2, item3: item3, item4: item4, item5: item5, item6: item6, item7: item7, item8: item8, item9: item9}
	
	;if (hasVal(itemlist, Clipboard))
	;{
		;for key, value in itemlist
			;if (value != "" and value = Clipboard)
			;{
				;%key% := ""
			;}
	;}
	
	if (Clipboard = item1)
		sleep 1
	else if (item1 = "")
	{
		item1 := Clipboard
	}
	else if (item2 = "")
	{
		item2 := item1, item1 := Clipboard
	}
	else if (item3 = "")
	{
		item3 := item2, item2 := item1, item1 := Clipboard
	}
	else if (item4 = "")
	{
		item4 := item3, item3 := item2, item2 := item1, item1 := Clipboard
	}
	else if (item5 = "")
	{
		item5 := item4, item4 := item3, item3 := item2, item2 := item1, item1 := Clipboard
	}
	else if (item6 = "")
	{
		item6 := item5, item5 := item4, item4 := item3, item3 := item2, item2 := item1, item1 := Clipboard
	}
	else if (item7 = "")
	{
		item7 := item6, item6 := item5, item5 := item4, item4 := item3, item3 := item2, item2 := item1, item1 := Clipboard
	}
	else if (item8 = "")
	{
		item8 := item7, item7 := item6, item6 := item5, item5 := item4, item4 := item3, item3 := item2, item2 := item1, item1 := Clipboard
	}
	else
	{
		item9 := item8, item8 := item7, item7 := item6, item6 := item5, item5 := item4, item4 := item3, item3 := item2, item2 := item1, item1 := Clipboard
	}
	
	LV_Modify(1,, "1", item1)
	LV_Modify(2,, "2", item2)
	LV_Modify(3,, "3", item3)
	LV_Modify(4,, "4", item4)
	LV_Modify(5,, "5", item5)
	LV_Modify(6,, "6", item6)
	LV_Modify(7,, "7", item7)
	LV_Modify(8,, "8", item8)
	LV_Modify(9,, "9", item9)
}
return

Capslock::
GUI, Show, NoActivate 
NumberPressedIncluded := InputHook("l1", "123456789abg{Esc}")
NumberPressedIncluded.start()
NumberPressedIncluded.Wait()
if (NumberPressedIncluded.Endkey = 1) or (NumberPressedIncluded.Endkey = 2) or (NumberPressedIncluded.Endkey = 3) or (NumberPressedIncluded.Endkey = 4) or (NumberPressedIncluded.Endkey = 5) or (NumberPressedIncluded.Endkey = 6) or (NumberPressedIncluded.Endkey = 7) or (NumberPressedIncluded.Endkey = 8) or (NumberPressedIncluded.Endkey = 9)
{
	NumberPressed := NumberPressedIncluded.Endkey
	tosend := % "item" Numberpressed
	toreallysend := % "%item" Numberpressed "%"
	ClipboardItemSelected := ""
	Transform, ClipboardItemSelected, Deref, %toreallysend%
	%tosend% := ""
	Gui, Cancel
	Clipboard := ClipboardItemSelected
	Clipwait 0.1
	Send ^v
}
else
	Gui, Cancel
return
