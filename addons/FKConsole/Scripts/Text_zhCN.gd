# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends Object
#-------------------------------------------------
const ErrorMessages = {
	"Target_missing_mv": "目标缺少函数或变量. (%s, %s)",
	"Target_destroyed": "引用目标已被释放. (%s)",
	"Ensure_failed": "调用函数失败，检查合法性失败. (%s, %s)",
	"Unknown_type": "无法调用未知类型对象. (%s, %s)",
	"First_arg": "第一个参数应当是对象类型. 您提供的是: %s.",
	"Second_arg": "C第二个参数应当是变量或函数名. 您提供的是: %s.",
	"Set_readonly": "I尝试设置只读属性，该操作将被忽略.",
	"Command_not_found": "`%s` 该命令不存在.",
	"Unknown_console_type": "控制台暂不支持 `%s` 类型.",
	"Error_first_arg": "第一个参数必须是 int 类型, 您提供的是: %s.",
	"Error_second_arg": "第二个参数必须继承于 BaseType. 如果想增加自定义类型，也请继承 BaseType.",
	"Error_falling_back": "%s, 退还为 Any 类型.",
}
#-------------------------------------------------
const Descriptions = {
	"Echo": "打印一个字符串.",
	"History": "打印先前使用的命令列表.",
	"Commands": "输出全部可用命令.",
	"Help": "打印命令使用方式详情.",
	"Quit": "关闭进程.",
	"Clear": "清除当前控制台.",
	"Version": "查看引擎版本.",
	"MaxFps": "设置程序最大FPS.取值[10, 1000]之间",
	"HelpInfo": "输入 [color=#ffff66][url=help]help[/url] <command-name>[/color] 获取命令详细用法信息.\n" + \
		"输入 [color=#ffff66][url=commands]commands[/url][/color] 可查看可用命令列表.\n" + \
		"输入 [color=#ffff66][url=quit]quit[/url][/color] 可退出程序.",
	"Argument": "期望参数 %s %s.",
	"Name": "命令名",
	"Usage": "用法",
	"Description": "描述",
	"Project": "项目名",
	"ConsoleUsage": "输入 [color=#ffff66][url=help]help[/url][/color] 获取控制台更多的使用方式",
	"Executing": "执行命令",
	"NoParams": "无需参数",
}
#-------------------------------------------------
