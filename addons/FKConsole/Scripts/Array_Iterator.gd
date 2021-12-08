# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends Reference
#-------------------------------------------------
const CallbackBuilder = preload("./Callback_Builder.gd")
# const Errors = preload("./Text_zhCN.gd").ErrorMessages
#-------------------------------------------------
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#-------------------------------------------------
var _object_get_value_callback
var _object_get_length_callback
var _iteration_current_index = 0
var length setget _set_readonly, length
#-------------------------------------------------
func _init(target, get_value_field = "get", get_length_field = "size"):
	_object_get_value_callback = CallbackBuilder.new(target).set_name(get_value_field).build()
	_object_get_length_callback = CallbackBuilder.new(target).set_name(get_length_field).build()
#-------------------------------------------------
# warning-ignore:function_conflicts_variable
func length():
	return self._object_get_length_callback.call()
#-------------------------------------------------
func _get(index):
	return self._object_get_value_callback.call([index])
#-------------------------------------------------
# warning-ignore:unused_argument
func _set_readonly(value):
	# print(Errors["Iterator.Set_readonly"])
	pass
#-------------------------------------------------
func first():
	if self.length:
		self._iteration_current_index = 0
		return self.get(self._iteration_current_index)
	return null
#-------------------------------------------------
func last():
	if self.length:
		self._iteration_current_index = self.length -1
		return self._get(self._iteration_current_index)
	return null
#-------------------------------------------------
func key():
	if self.length:
		return self._iteration_current_index
	return null
#-------------------------------------------------
func next():
	if self.length and self._iteration_current_index < self.length - 1:
		self._iteration_current_index += 1
		return self._get(self._iteration_current_index)
	return null
#-------------------------------------------------
func previous():
	if self.length and self._iteration_current_index > 0:
		self._iteration_current_index -= 1
		return self._get(self._iteration_current_index)
	return null
#-------------------------------------------------
func current():
	if self.length:
		return self._get(self._iteration_current_index)
	return null
#-------------------------------------------------
func _iter_init(_arg):
	self._iteration_current_index = 0
	return self._iteration_current_index < self.length
#-------------------------------------------------
func _iter_next(_arg):
	self._iteration_current_index += 1
	return self._iteration_current_index < self.length
#-------------------------------------------------
func _iter_get(_arg = null):
	return self._get(self._iteration_current_index)
#-------------------------------------------------
