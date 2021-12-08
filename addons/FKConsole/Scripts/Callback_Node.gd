# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends "./Callback_AbstractNode.gd"
#-------------------------------------------------
const Errors = preload("./Text_zhCN.gd").ErrorMessages
#-------------------------------------------------
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#-------------------------------------------------
var _name
#-------------------------------------------------
func _init(target, name, type = utils.Type.UNKNOWN).(target, type if type != utils.Type.UNKNOWN else utils.get_type(target, name)):
	self._name = name
#-------------------------------------------------
func get_name():
	return self._name
#-------------------------------------------------
func ensure():
	if self._target:
		var wr = weakref(self._target)
		if wr.get_ref() == null:
			print(Errors["Target_destroyed"] % self._name)
			return false
	else:
		print(Errors["Target_destroyed"] % self._name)
		return false
	if utils.get_type(self._target, self._name) == utils.Type.UNKNOWN:
		print(Errors["Target_missing_mv"] % [self._target, self._name])
		return false
	return true
#-------------------------------------------------
func call(argv = []):
	# 预检查
	if !ensure():
		print(Errors["Ensure_failed"] % [self._target, self._name])
		return
	argv = self._get_args(argv)
	
	if self._type == utils.Type.VARIABLE:
		if argv.size():
			self._target.set(self._name, argv[0])
		return self._target.get(self._name)
	elif self._type == utils.Type.METHOD:
		return self._target.callv(self._name, argv)
	else:
		print(Errors["Unknown_type"] % [self._target, self._name])
#-------------------------------------------------
