# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends './Type_BaseRegex.gd'
#-------------------------------------------------
func _init().('Float', '^[+-]?([0-9]*[\\.\\,]?[0-9]+|[0-9]+[\\.\\,]?[0-9]*)([eE][+-]?[0-9]+)?$'):
	pass
#-------------------------------------------------
func normalize(value):
	return float(self._reextract(value).replace(',', '.'))
#-------------------------------------------------
