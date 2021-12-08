# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends Object
#-------------------------------------------------
const ErrorMessages = {
	"Target_missing_mv": "Target is missing method/variable. (%s, %s)",
	"Target_destroyed": "Failed to call a callback, target was previously destroyed. (%s)",
	"Ensure_failed": "Failed to call a callback, ensuring failed. (%s, %s)",
	"Unknown_type": "Unable to call unknown type. (%s, %s)",
	"First_arg": "First argument must be target object. Provided: %s.",
	"Second_arg": "Second argument must be variable or method name (string). Provided: %s.",
	"Set_readonly": "Attempted to set readonly value, ignoring.",
	"Command_not_found": "Command not found. (%s)",
	"Unknown_console_type": "Type `%s` is not supported by console, please rerer to the documentation to obtain full list of supported engine types.",
	"Error_first_arg": "First argument (engine_type) must be of type int, `%s` type provided.",
	"Error_second_arg": "Second argument (type) must extend BaseType. If you want to use custom types please extend BaseType.",
	"Error_falling_back": "%s Falling back to `Any` type.",
}
#-------------------------------------------------
const Descriptions = {
	"Echo": "Prints a string.",
	"History": "Print all previous commands used during the session",
	"Commands": "Lists all available commands.",
	"Help": "Outputs usage instructions.",
	"Quit": "Exit application.",
	"Clear": "Clear the terminal.",
	"Version": "Shows engine version.",
	"MaxFps": "The maximal framerate at which the application can run.",
	"HelpInfo": "Type [color=#ffff66][url=help]help[/url] <command-name>[/color] show information about command.\n" + \
		"Type [color=#ffff66][url=commands]commands[/url][/color] to get a list of all commands.\n" + \
		"Type [color=#ffff66][url=quit]quit[/url][/color] to exit the application.",
	"Argument": "Expected %s %s as argument.",
	"Name": "NAME",
	"Usage": "USAGE",
	"Description": "DESCRIPTION",
	"Project": "PROJECT",
	"ConsoleUsage": "Type [color=#ffff66][url=help]help[/url][/color] to get more information about usage.",
	"Executing": "Executing command",
	"NoParams": "No params needed",
}
#-------------------------------------------------
