# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
# @const  String
const CONSOLE_TOGGLE = "fk_console_toggle"
# @const  Dictionary
const console_toggle_props = {
  "name": CONSOLE_TOGGLE,
  "events": [
	{
	  "command": true,
	  "scancode": KEY_QUOTELEFT,
	}
  ]
}

# @const  String
const CONSOLE_AUTOCOMPLETE = "fk_console_autocomplete"
# @const  Dictionary
const console_autocomplete_props = {
  "name": CONSOLE_AUTOCOMPLETE,
  "events": [
	{
	  "scancode": KEY_TAB,
	}
  ]
}

# @const  String
const CONSOLE_HISTORY_UP = "fk_console_history_up"
# @const  Dictionary
const console_history_up_props = {
  "name": CONSOLE_HISTORY_UP,
  "events": [
	{
	  "scancode": KEY_UP,
	}
  ]
}

# @const  String
const CONSOLE_HISTORY_DOWN = "fk_console_history_down"
# @const  Dictionary
const console_history_down_props = {
  "name": CONSOLE_HISTORY_DOWN,
  "events": [
	{
	  "scancode": KEY_DOWN,
	}
  ]
}
