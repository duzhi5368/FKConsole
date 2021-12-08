# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends Reference
#-------------------------------------------------
enum TYPE \
{
	DEBUG,
	INFO,
	WARNING,
	ERROR,
	NONE
}
#-------------------------------------------------
var logLevel = TYPE.WARNING
#-------------------------------------------------
func set_log_level(in_log_level):
	logLevel = in_log_level
	return self
#-------------------------------------------------
func get_time():
	var time = OS.get_time()
	return String(time.hour) +":"+String(time.minute)+":"+String(time.second)
#-------------------------------------------------
func log(message, type = TYPE.INFO):
	match type:
		TYPE.DEBUG:   debug(message)
		TYPE.INFO:    info(message)
		TYPE.WARNING: warn(message)
		TYPE.ERROR:   error(message)
	return self
#-------------------------------------------------
func debug(message):
	if logLevel <= TYPE.DEBUG:
		Console.write_line('[color=#999999]' + get_time() + ' ' + '[DBUG]\t' +  str(message) + '[/color]')
	return self
#-------------------------------------------------
func info(message):
	if logLevel <= TYPE.INFO:
		Console.write_line('[color=#FFFAFA]' + get_time() + ' ' + '[INFO]\t' +  str(message) + '[/color]')
	return self
#-------------------------------------------------
func warn(message):
	if logLevel <= TYPE.WARNING:
		Console.write_line('[color=#FFFF33]' + get_time() + ' ' + '[WARN]\t' +  str(message) + '[/color]')
	return self
#-------------------------------------------------
func error(message):
	if logLevel <= TYPE.ERROR:
		Console.write_line('[color=#FF0033]' + get_time() + ' ' + '[ERRO]\t' +  str(message) + '[/color]')
	return self
#-------------------------------------------------
