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
func _init(target).(target, utils.Type.METHOD):
	pass
#-------------------------------------------------
func ensure():
	return self._target.is_valid()
#-------------------------------------------------
func call(argv = []):
	if !ensure():
		print(Errors["Ensure_failed"] % [self._target])
		return
	return self._target.call_funcv(self._get_args(argv))
#-------------------------------------------------
