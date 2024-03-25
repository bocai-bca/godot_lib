extends Object
class_name LinkedList

var next:LinkedList = null:
	get:
		return next
	set(_list_node):
		next = _list_node
var value:Variant = null:
	get:
		return value
	set(_value):
		value = _value

func _init(_value = null, _next = null)->void:
	value = _value
	next = _next

func insert(_value = null)->void:
	var original_next:LinkedList = next
	next = LinkedList.new(_value, original_next)

func dump_to_array()->Array:
	var result:Array = [value]
	var pointer:LinkedList
	while (pointer.next != null):
		pointer = pointer.next
		result.append(pointer.value)
	return result
