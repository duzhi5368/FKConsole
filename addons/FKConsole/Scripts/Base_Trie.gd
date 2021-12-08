# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
extends Reference
#-------------------------------------------------
const TrieNode = preload('./Base_TrieNode.gd')
#-------------------------------------------------
var _root
#-------------------------------------------------
func _init():
	self._root = TrieNode.new()
#-------------------------------------------------
func insert(key, value):
	var current_node = self._root
	var length = len(key)
	for level in range(length):
		var index = key[level]
		if not current_node.has_child(index):
			current_node.initialize_child_at(index)
		current_node = current_node.get_child(index)
	if current_node.value:
		return
	current_node.value = value
#-------------------------------------------------
func has(key):
	return !!self.get(key)
#-------------------------------------------------
func get(key):
	var current_node = self._root
	var length = len(key)
	for level in range(length):
		var index = key[level]
		if not current_node.has_child(index):
			return null
		current_node = current_node.get_child(index)
	return current_node.value
#-------------------------------------------------
