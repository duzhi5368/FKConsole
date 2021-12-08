# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends "./Array_Collection.gd"
#-------------------------------------------------
const CallbackBuilder = preload("./Callback_Builder.gd")
#-------------------------------------------------
func _init(collection = {}).(collection):
	pass
#-------------------------------------------------
func find(command_name):
	var filter_cb_fn = CallbackBuilder.new(self).set_method("_find_match").bind([command_name]).build()
	return self.filter(filter_cb_fn)
#-------------------------------------------------
func _find_match(match_key, key, value, _i, _collection):
	return key.begins_with(match_key)
#-------------------------------------------------
