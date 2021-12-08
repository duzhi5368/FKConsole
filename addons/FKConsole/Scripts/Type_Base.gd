# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
enum CHECK \
{
	OK,
	FAILED,
	CANCELED
}
#-------------------------------------------------
var _name
#-------------------------------------------------
func _init(name):
	self._name = name
#-------------------------------------------------
# warning-ignore:unused_argument
func check(value):
	return CHECK.OK
#-------------------------------------------------
func normalize(value):
	return value
#-------------------------------------------------
func to_string():
	return self._name
#-------------------------------------------------
