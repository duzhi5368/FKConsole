### 使用流程：
- 拷贝代码到项目addons目录下，使目录为 addons/FKConsole
- 在【项目】->【项目设置】->【插件】中，选择 FKConsole ，并设置状态为【启用】即可。


### 使用代码样例：

```
extends Node2D

const logger = preload("res://addons/FKConsole/Scripts/Base_Logger.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	print_helloworld()
	registe_command()

# 测试打印
func print_helloworld():
	Console.Log.set_log_level(logger.TYPE.DEBUG)
	Console.Log.debug("hello," + "world!" + "测试中文")
	Console.Log.info("hello," + "world!" + "测试中文")
	Console.Log.warn("hello," + "world!" + "测试中文")
	Console.Log.error("hello," + "world!" + "测试中文")
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
```