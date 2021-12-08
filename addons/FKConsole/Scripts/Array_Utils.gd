# Created by Freeknight
# 2021/11/29
# 说明：一些常用静态函数存放地
#-------------------------------------------------
extends Reference
#-------------------------------------------------
#const errors = preload("./Errors_zhCN.gd").ErrorMessages
#-------------------------------------------------
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#-------------------------------------------------
static func to_array(value):
	if is_array(value):
		return value
	elif typeof(value) != TYPE_NIL:
		return [value]
	return []
#-------------------------------------------------
static func is_array(value):
	return typeof(value) >= TYPE_ARRAY and typeof(value) <= TYPE_COLOR_ARRAY
#-------------------------------------------------	
static func to_dict(value):
	if typeof(value) == TYPE_DICTIONARY:
		return value
	var result = {}
	if typeof(value) != TYPE_NIL:
		if is_array(value):
			for i in value.size():
				result[i] = value[i]
		else:
			result[0] = value
	return result
#-------------------------------------------------
static func is_dictionary(value):
	return typeof(value) == TYPE_DICTIONARY
#-------------------------------------------------
static func flatten(in_array, out_array = [], depth = -1):
	assert(typeof(in_array) == TYPE_ARRAY, "In_array must be array")
	for i in in_array.size():
		if is_array(in_array[i]) and depth > 0:
			flatten(in_array[i], out_array, depth -1)
		else:
			out_array.append(in_array[i])
	return out_array
#-------------------------------------------------
