extends Node2D

const logger = preload("res://addons/FKConsole/Scripts/Base_Logger.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	print_helloworld()
	registe_command()

# 测试打印
func print_helloworld():
	Console.Log.set_log_level(logger.TYPE.WARNING)
	Console.Log.debug("hello," + "world!" + "测试中文")
	Console.Log.info("hello," + "world!" + "测试中文")
	Console.Log.warn("hello," + "world!" + "测试中文")
	Console.Log.error("hello," + "world!" + "测试中文")
	Console.Log.set_log_level(logger.TYPE.DEBUG)
	Console.Log.log("hello," + "world!" + "测试中文", logger.TYPE.DEBUG)

# 命令执行函数
func my_print(strParams = ''):
	Console.write_line(strParams)

# 注册自定义命令
func registe_command():
	Console.add_command('print', self, 'my_print')\
			.set_description('打印')\
			.add_argument('strParams', TYPE_STRING)\
			.register()
