# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends Reference
#-------------------------------------------------
const Argument = preload('./Argument_Node.gd')
const Descriptions = preload('./Text_zhCN.gd').Descriptions
#-------------------------------------------------
var _name
var _target
var _arguments
var _description
#-------------------------------------------------
func _init(name, target, arguments = [], description = null):
	self._name = name
	self._target = target
	self._arguments = arguments
	self._description = description
#-------------------------------------------------
func get_name():
	return self._name
#-------------------------------------------------
func get_target():
	return self._target
#-------------------------------------------------
func get_arguments():
	return self._arguments
#-------------------------------------------------
func get_description():
	return self._description
#-------------------------------------------------
func execute(inArgs = []):
	var args = []
	var argAssig
	var i = 0
	while i < self._arguments.size() and i < inArgs.size():
		argAssig = self._arguments[i].set_value(inArgs[i])
		if argAssig == FAILED:
			FKConsole.Log.warn(Descriptions["Argument"] % [self._arguments[i].get_type().to_string(), str(i + 1)])
			return
		elif argAssig == Argument.ASSIGNMENT.CANCELED:
			return OK
		args.append(self._arguments[i].get_normalized_value())
		i += 1
	return self._target.call(args)
#-------------------------------------------------
func describe():
	FKConsole.write_line(Descriptions["Name"])
	FKConsole.write_line(self._get_command_name())
	#FKConsole.write_line()
	FKConsole.write_line(Descriptions["Usage"])
	FKConsole.write(self._get_command_name())
	if self._arguments.size() > 0:
		for arg in self._arguments:
			FKConsole.write(' [color=#88ffff]%s[/color]' %  arg.describe())
	else:
		FKConsole.write(' [color=#88ffff]' + Descriptions["NoParams"] + '[/color]')
	FKConsole.write_line()
	#FKConsole.write_line()
	if self._description:
		FKConsole.write_line(Descriptions["Description"])
		FKConsole.write_line('	' + self._description)
	#FKConsole.write_line()
#-------------------------------------------------
func _get_command_name():
	return '	[color=#ffff66][url=%s]%s[/url][/color]' % [self._name, self._name]
#-------------------------------------------------
