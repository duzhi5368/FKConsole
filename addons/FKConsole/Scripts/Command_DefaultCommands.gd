# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends Reference
#-------------------------------------------------
const Descriptions = preload("./Text_zhCN.gd").Descriptions
const Errors = preload("./Text_zhCN.gd").ErrorMessages
#-------------------------------------------------
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#-------------------------------------------------
var _console
#-------------------------------------------------
func _init(console):
	self._console = console
	self._console.add_command('echo', self._console, 'write')\
		.set_description(Descriptions["Echo"])\
		.add_argument('text', TYPE_STRING)\
		.register()
	self._console.add_command('history', self._console.History, 'print_all')\
		.set_description(Descriptions["History"])\
		.register()
	self._console.add_command('commands', self, '_list_commands')\
		.set_description(Descriptions["Commands"])\
		.register()
	self._console.add_command('help', self, '_help')\
		.set_description(Descriptions["Help"])\
		.add_argument('command', TYPE_STRING)\
		.register()
	self._console.add_command('quit', self, '_quit')\
		.set_description(Descriptions["Quit"])\
		.register()
	self._console.add_command('clear', self._console)\
		.set_description(Descriptions["Clear"])\
		.register()
	self._console.add_command('version', self, '_version')\
		.set_description(Descriptions["Version"])\
		.register()
	self._console.add_command('fps_max', Engine, 'set_target_fps')\
		.set_description(Descriptions["MaxFps"])\
		.add_argument('fps', self._console.IntRangeType.new(10, 1000))\
		.register()
#-------------------------------------------------
func _help(command_name = null):
	if command_name:
		var command = self._console.get_command(command_name)
		if command:
			command.describe()
		else:
			self._console.Log.warn(Errors["Command_not_found"] %  command_name)

	else:
		self._console.write_line(Descriptions["HelpInfo"])
#-------------------------------------------------
func _version():
	self._console.write_line(Engine.get_version_info())
#-------------------------------------------------
func _list_commands():
	for command in self._console._command_service.values():
		var name = command.get_name()
		self._console.write('[color=#ffff66][url=%s]%s[/url][/color]\t' % [ name, name ])
	self._console.write_line('')
#-------------------------------------------------
func _quit():
	self._console.Log.warn(Descriptions["Quit"])
	self._console.get_tree().quit()
#-------------------------------------------------
