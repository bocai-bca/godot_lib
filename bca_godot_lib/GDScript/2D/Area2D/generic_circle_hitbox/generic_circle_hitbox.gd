extends Area2D

@onready var _shape_0:Node = get_node("true_shape")
@onready var _shape_1:Node = get_node("last_tick_shape")
@onready var _offset:Node = get_node("offset_shape")

func _ready()->void:
	return

func set_offset(last_tick_pos_offset:Vector2)->void:
	_shape_1.set_position(last_tick_pos_offset)
	_offset.shape.set_b(Vector2(last_tick_pos_offset.length(), 0.0))
	_offset.set_rotation(Vector2(0.0, 0.0).angle_to_point(last_tick_pos_offset))
	_offset.set_scale(Vector2(1.0, (2.0 / 3.0) * _shape_0.shape.radius))

func set_radius(radius:float)->void:
	_shape_0.shape.radius = radius
	_offset.set_scale(Vector2(1.0, (2.0 / 3.0) * _shape_0.shape.radius))

func get_radius()->float:
	return _shape_0.shape.get_radius()
