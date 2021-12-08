# Created by Freeknight
# 2021/11/29
# 说明：
#-------------------------------------------------
class TrieNode:
	#-------------------------------------------------
	var _children
	var value
	#-------------------------------------------------
	func _init():
		self._children = {}
		self.value = null
	#-------------------------------------------------
	func get_children():
		return self._children
	#-------------------------------------------------
	func has_child(index):
		return index in self._children
	#-------------------------------------------------
	func get_child(index):
		return self._children[index]
	#-------------------------------------------------
	func initialize_child_at(index):
		self._children[index] = TrieNode.new()
#-------------------------------------------------
