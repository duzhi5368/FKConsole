extends Node2D

const logger = preload("res://addons/FKConsole/Scripts/Base_Logger.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	print_helloworld()
	registe_command()

# 测试打印
func print_helloworld():
	FKConsole.Log.set_log_level(logger.TYPE.WARNING)
	FKConsole.Log.debug("hello," + "world!" + "测试中文")
	FKConsole.Log.info("hello," + "world!" + "测试中文")
	FKConsole.Log.warn("hello," + "world!" + "测试中文")
	FKConsole.Log.error("hello," + "world!" + "测试中文")
	FKConsole.Log.set_log_level(logger.TYPE.DEBUG)
	FKConsole.Log.log("hello," + "world!" + "测试中文", logger.TYPE.DEBUG)

# 命令执行函数
func my_print(strParams = ''):
	FKConsole.write_line(strParams)

# 注册自定义命令
func registe_command():
	FKConsole.add_command('print', self, 'my_print')\
			.set_description('打印')\
			.add_argument('strParams', TYPE_STRING)\
			.register()
