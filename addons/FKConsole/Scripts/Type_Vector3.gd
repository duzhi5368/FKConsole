# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends './Type_BaseRegex.gd'
#-------------------------------------------------
var _normalized_value
#-------------------------------------------------
func _init().('Vector3', '^[+-]?([0-9]*[\\.\\,]?[0-9]+|[0-9]+[\\.\\,]?[0-9]*)([eE][+-]?[0-9]+)?$'):
	pass
#-------------------------------------------------
func check(value):
	var values = str(value).split(',', false, 3)
	if values.size() < 3:
		if values.size() == 2:
			values.append('0')
		elif values.size() == 1:
			values.append('0')
			values.append('0')
		else:
			return CHECK.FAILED
	for i in range(2):
		if .check(values[i]) == CHECK.FAILED:
			return CHECK.FAILED
	self._normalized_value = Vector3(values[0], values[1], values[2])
	return CHECK.OK
#-------------------------------------------------
# warning-ignore:unused_argument
func normalize(value):
	return self._normalized_value
#-------------------------------------------------
