# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends './Array_QueueCollection.gd'
#-------------------------------------------------
func _init(maxLength):
	self.set_max_length(maxLength)
#-------------------------------------------------
func print_all():
	var i = 1
	for command in self.get_value_iterator():
		Console.write_line(\
			'[b]' + str(i) + '.[/b] [color=#ffff66][url=' + \
			command + ']' + command + '[/url][/color]')
		i += 1
	return self
#-------------------------------------------------
