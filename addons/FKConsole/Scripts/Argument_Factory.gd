# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends Reference
#-------------------------------------------------
const Argument = preload('./Argument_Node.gd')
const TypeFactory = preload('./Type_Factory.gd')
const BaseType = preload('./Type_Base.gd')
const Result = preload('./Base_Result.gd')
const Error = preload('./Base_Error.gd')
const ErrorMessages = preload('./Text_zhCN.gd').ErrorMessages
const ErrorCode = preload('./Base_ErrorCode.gd')
#-------------------------------------------------
static func create(name, type = 0, description = null):
	var error_message
	if typeof(type) == TYPE_INT:
		var type_result = TypeFactory.create(type)
		if type_result.has_error():
			error_message = ErrorMessages["Error_falling_back"] % type_result.get_error().get_message()
			type = TypeFactory.create(0).get_value()
		else:
			type = type_result.get_value()
	if not type is BaseType:
		return Result.new(null, ErrorMessages["Error_second_arg"])
	var error
	if error_message:
		error = Error.new(error_message, ErrorCode.ERRORCODE_FALLBACK_FAILED)
	return Result.new(Argument.new(name, type, description), error)
#-------------------------------------------------
