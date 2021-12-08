# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
const Result = preload('./Base_Result.gd')
const Errors = preload("./Text_zhCN.gd").ErrorMessages
#-------------------------------------------------
const TYPE_LIST = [
	preload('Type_Any.gd'),
	preload('Type_Bool.gd'),
	preload('Type_Int.gd'),
	preload('Type_Float.gd'),
	preload('Type_String.gd'),
	preload('Type_Vector2.gd'),
	preload('Type_Vector3.gd'),
]
#-------------------------------------------------
static func _type_const_to_type_list_index(type):
	if type >= 0 and type < TYPE_LIST.size() and TYPE_LIST[type] != null:
		return Result.new(TYPE_LIST[type])
	else:
		return Result.new(null, Errors["Unknown_console_type"] % int(type))
#-------------------------------------------------
static func create(engine_type):
	if typeof(engine_type) != TYPE_INT:
		return Result.new(null, Errors["Error_first_arg"] % typeof(engine_type))
	var engine_type_result = _type_const_to_type_list_index(engine_type)
	if engine_type_result.has_error():
		return engine_type_result
	return Result.new(engine_type_result.get_value().new())
#-------------------------------------------------
