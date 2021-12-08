# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends Reference
#-------------------------------------------------
const Utils = preload("./Callback_Utils.gd")
const Callback = preload("./Callback_Node.gd")
const FuncRefCallback = preload("./Callback_FuncRefCallback.gd")
const Errors = preload("./Text_zhCN.gd").ErrorMessages
#-------------------------------------------------
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#-------------------------------------------------
var _target
var _name
var _type
var _bind_argv
#-------------------------------------------------
func _init(target):
	self._target = target
	self._type = Utils.Type.UNKNOWN
	self._bind_argv = []
#-------------------------------------------------
func set_name(name):
	self._name = name
	return self
#-------------------------------------------------
func get_name():
	return self._name
#-------------------------------------------------
func set_variable(name):
	self._name = name
	self._type = Utils.Type.VARIABLE
	return self
#-------------------------------------------------
func set_method(name):
	self._name = name
	self._type = Utils.Type.METHOD
	return self
#-------------------------------------------------
func set_type(type):
	self._type = type
	return self
#-------------------------------------------------
func get_type():
	return self._type
#-------------------------------------------------
func bind(argv = []):
	self._bind_argv = argv
	return self
#-------------------------------------------------
func build():
	if typeof(self._target) != TYPE_OBJECT:
		print(Errors["Call.First_arg"] % str(typeof([self._target])))
		return null
	if Utils.is_funcref(self._target):
		return FuncRefCallback.new(self._target)
	if typeof(self._name) != TYPE_STRING:
		print(Errors["Call.Second_arg"] % str(typeof([self._name])))
		return null
	if not self._type or self._type == Utils.Type.UNKNOWN:
		self._type = Utils.get_type(self._target, self._name)
		if self._type == Utils.Type.UNKNOWN:
			print(Errors["Target_missing_mv"] % [self._target, self._name])
			return null
	var callbackObj = Callback.new(self._target, self._name, self._type)
	callbackObj.bind(self._bind_argv)
	return callbackObj	
#-------------------------------------------------
