# Created by Freeknight
# 2021/11/29
# 说明：回调抽象基本类，声明接口
#-------------------------------------------------
extends Reference
#-------------------------------------------------
const utils = preload("./Callback_Utils.gd")
#-------------------------------------------------
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#-------------------------------------------------
var _target
var _type
var _bind_argv
#-------------------------------------------------
func _init(target, type):
	self._target = target
	self._type = type
	self._bind_argv = []
#-------------------------------------------------
func get_target():
	return self._target
#-------------------------------------------------	
func get_type():
	return self._type
#-------------------------------------------------
func _get_args(args = []):
	var new_args = self._bind_argv.duplicate()
	for arg in args:
		new_args.append(arg)
	return new_args
#-------------------------------------------------
func ensure():
	pass
#-------------------------------------------------
func bind(argv = []):
	for _argv in argv:
		self._bind_argv.append(_argv)
#-------------------------------------------------
# warning-ignore:unused_argument
func call(argv = []):
	pass
#-------------------------------------------------
