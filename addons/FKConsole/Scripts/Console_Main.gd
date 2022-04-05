# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends CanvasLayer
#-------------------------------------------------
const BaseCommands = preload('./Command_DefaultCommands.gd')
const DefaultActions = preload('./UI_DefaultActions.gd')
const CommandService = preload('./Command_Service.gd')
const IntRangeType = preload('./Type_IntRange.gd')
const FloatRangeType = preload('./Type_FloatRange.gd')
const FilterType = preload('./Type_Filter.gd')
const Descriptions = preload("./Text_zhCN.gd").Descriptions
const Errors = preload("./Text_zhCN.gd").ErrorMessages
#-------------------------------------------------
## Signals
#-------------------------------------------------
# @param  String       name
# @param  Reference    target
# @param  String|null  target_name
signal command_added(name, target, target_name)
# @param  String  name
signal command_removed(name)
# @param  Command  command
signal command_executed(command)
# @param  String  name
signal command_not_found(name)
#-------------------------------------------------
# @var  History
var History = preload('./Base_History.gd').new(100) setget _set_readonly
# @var  Logger
var Log = preload('./Base_Logger.gd').new() setget _set_readonly
# @var  Command/CommandService
var _command_service
# @var  RegEx
var _erase_bb_tags_regex
# @var  bool
var is_console_shown = true setget _set_readonly
# @var  bool
var consume_input = true
# @var  Control
var previous_focus_owner = null
#-------------------------------------------------
### Console nodes
#-------------------------------------------------
onready var _console_box = $ConsoleBox
onready var Text = $ConsoleBox/Container/ConsoleText setget _set_readonly
onready var ConsolePanel = $ConsoleBox/Container/Panel setget _set_readonly
onready var ButtonCommand = $ConsoleBox/Container/Panel/Button_Commands setget _set_readonly
onready var Line = $ConsoleBox/Container/Panel/ConsoleLine setget _set_readonly
onready var _animation_player = $ConsoleBox/AnimationPlayer
#-------------------------------------------------
func _init():
	self._command_service = CommandService.new(self)
	self._erase_bb_tags_regex = RegEx.new()
	self._erase_bb_tags_regex.compile('\\[[\\/]?[a-z0-9\\=\\#\\ \\_\\-\\,\\.\\;]+\\]')
#-------------------------------------------------
func _ready():
	self.Text.set_selection_enabled(true)
	self.Text.set_scroll_follow(true)
	self.Text.connect('meta_clicked', self.Line, 'set_text')
	self.ButtonCommand.connect('pressed', self.Line, 'execute', ['commands'])
	self._console_box.hide()
	self._animation_player.connect("animation_finished", self, "_toggle_animation_finished")
	set_process_input(true)
	self.toggle_console()
	var v = Engine.get_version_info()

# see: http://patorjk.com/software/taag
#
#	self.write_line("8888888888 888    d8P   .d8888b.                                      888          ")
#	self.write_line("888        888   d8P   d88P  Y88b                                     888          ")
#	self.write_line("888        888  d8P    888    888                                     888          ")
#	self.write_line("8888888    888d88K     888         .d88b.  88888b.  .d8888b   .d88b.  888  .d88b.  ")
#	self.write_line("888        8888888b    888        d88``88b 888 `88b 88K      d88``88b 888 d8P  Y8b ")
#	self.write_line("888        888  Y88b   888    888 888  888 888  888 `Y8888b. 888  888 888 88888888 ")
#	self.write_line("888        888   Y88b  Y88b  d88P Y88..88P 888  888      X88 Y88..88P 888 Y8b.     ")
#	self.write_line("888        888    Y88b  `Y8888P`   `Y88P`  888  888  88888P'  `Y88P`  888  `Y8888  ")

	self.write_line(\
		Descriptions["Project"] + ': [' + ProjectSettings.get_setting("application/config/name") + \
		"] (Godot " + str(v.major) + '.' + str(v.minor) + '.' + str(v.patch) + ' ' + v.status+")" + \
		Descriptions["ConsoleUsage"])
	self.write_line("如果这行log出现了两次，则说明本类被重复加载，请移除一处引用。")
	self.BaseCommands.new(self)
#-------------------------------------------------
func _process(delta):
	if Input.is_action_just_pressed(DefaultActions.CONSOLE_TOGGLE):
		self.toggle_console()
#-------------------------------------------------
func get_command_service():
	return self._command_service
#-------------------------------------------------
func get_command(name):
	return self._command_service.get(name)
#-------------------------------------------------
func find_commands(name):
	return self._command_service.find(name)
#-------------------------------------------------
func add_command(name, target, target_name = null):
	emit_signal("command_added", name, target, target_name)
	return self._command_service.create(name, target, target_name)
#-------------------------------------------------
func remove_command(name):
	emit_signal("command_removed", name)
	return self._command_service.remove(name)
#-------------------------------------------------
func write(message):
	message = str(message)
	if self.Text:
		self.Text.append_bbcode(message)
	print(self._erase_bb_tags_regex.sub(message, '', true))
#-------------------------------------------------
func write_line(message = ''):
	message = str(message)
	if self.Text:
		self.Text.append_bbcode(message + '\n')
	print(self._erase_bb_tags_regex.sub(message, '', true))
#-------------------------------------------------
func clear():
	if self.Text:
		self.Text.clear()
#-------------------------------------------------
func toggle_console():
	#print("enter: " + String(self.is_console_shown))
	if !self.is_console_shown:
		previous_focus_owner = self.Line.get_focus_owner()
		self._console_box.show()
		self.Line.clear()
		self.Line.grab_focus()
		self._animation_player.play_backwards('fade')
	else:
		self.Line.accept_event()
		if is_instance_valid(previous_focus_owner):
			previous_focus_owner.grab_focus()
		previous_focus_owner = null
		self._animation_player.play('fade')
	is_console_shown = !self.is_console_shown
	self.is_console_shown = is_console_shown
	#print("leave: " + String(self.is_console_shown))
	return self
#-------------------------------------------------
func _toggle_animation_finished(animation):
	if !self.is_console_shown:
		self._console_box.hide()
#-------------------------------------------------
func _set_readonly(value):
	# Log.warn(Errors["Iterator.Set_readonly"])
	pass
#-------------------------------------------------
