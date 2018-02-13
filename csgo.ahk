#InstallKeybdHook
#SingleInstance
SendMode Input

XButton1::return

NumLock::1
NumpadDiv::2
PgUp::Esc
End::F2
Home::F7

GetKeyboardLanguage(_hWnd=0) {
	if !_hWnd
		ThreadId=0
	else
		if !ThreadId := DllCall("user32.dll\GetWindowThreadProcessId", "Ptr", _hWnd, "UInt", 0, "UInt")
			return false
	
	if !KBLayout := DllCall("user32.dll\GetKeyboardLayout", "UInt", ThreadId, "UInt")
		return false
	
	return KBLayout & 0xFFFF
}

remap(remap, default) {
	if WinExist("Counter-Strike: Global Offensive") {
		Send {%remap%}
	} else {
		if (remap = "F7") {
			LangID := GetKeyboardLanguage(WinActive("A"))
			if (LangID = 0x0409) {
				Send {U+0060}
			} else {
				Send {U+00A7}
			}
		}
	}
}
SC029::remap("F7", 0)
