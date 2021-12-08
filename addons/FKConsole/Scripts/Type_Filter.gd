# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends './Type_Base.gd'
#-------------------------------------------------
enum MODE \
{
	ALLOW,
	DENY
}
#-------------------------------------------------
var _filterList
var _mode
#-------------------------------------------------
func _init(filterList, mode = MODE.ALLOW).('Filter'):
	self._filterList = filterList
	self._mode = mode
#-------------------------------------------------
func check(value):
	if (self._mode == MODE.ALLOW and self._filterList.has(value)) or \
		(self._mode == MODE.DENY and !self._filterList.has(value)):
		return CHECK.OK
	return CHECK.CANCELED
#-------------------------------------------------
