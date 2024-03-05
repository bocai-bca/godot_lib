extends Area2D

@onready var _shape_0:Node = get_node("true_shape")
@onready var _shape_1:Node = get_node("last_tick_shape")
@onready var _offset:Node = get_node("offset_shape")

func _ready()->void:
	set_shape(_shape_0.shape.size)

func set_offset(last_tick_pos_offset:Vector2, last_tick_rot_offset:float)->void:
	_shape_1.set_position(last_tick_pos_offset)
	_shape_1.set_rotation(last_tick_rot_offset)
	if (last_tick_pos_offset == Vector2(0.0, 0.0)):
		_offset.polygon = PackedVector2Array([Vector2(), Vector2(), Vector2(), Vector2()])
	var size:Vector2 = _shape_0.shape.size
	var a_diagonals:Array[diagonal] = [
		diagonal.new(Vector2(size.x / -2.0, size.y / -2.0), Vector2(size.x / 2.0, size.y / 2.0)),
		diagonal.new(Vector2(size.x / -2.0, size.y / 2.0), Vector2(size.x / 2.0, size.y / -2.0))
	]
	var b_diagonals:Array[diagonal] = [
		diagonal.new(
			Vector2(size.x / -2.0, size.y / -2.0).rotated(last_tick_rot_offset) + last_tick_pos_offset,
			Vector2(size.x / 2.0, size.y / 2.0).rotated(last_tick_rot_offset) + last_tick_pos_offset
		),
		diagonal.new(
			Vector2(size.x / -2.0, size.y / 2.0).rotated(last_tick_rot_offset) + last_tick_pos_offset,
			Vector2(size.x / 2.0, size.y / -2.0).rotated(last_tick_rot_offset) + last_tick_pos_offset
		)
	]
	var b_diagonal_angle_0:float = abs(tan(b_diagonals[0].point_0.angle_to_point(b_diagonals[0].point_1)))
	var b_diagonal_angle_1:float = abs(tan(b_diagonals[1].point_0.angle_to_point(b_diagonals[1].point_1)))
	var b_use_diagonal:int = 0
	var line_ab:Vector2 = Vector2(0.0, 0.0).direction_to(last_tick_pos_offset)
	var line_ab_ortho:Vector2 = line_ab.orthogonal()
	if (last_tick_rot_offset != 0.0):
		var b_diagonal_0_vertical:float = abs(fmod(line_ab_ortho.angle() - b_diagonal_angle_0, PI))
		var b_diagonal_1_vertical:float = abs(fmod(line_ab_ortho.angle() - b_diagonal_angle_1, PI))
		if (b_diagonal_0_vertical > b_diagonal_1_vertical):
			b_use_diagonal = 1
		else:
			b_use_diagonal = 2
	var a_use_diagonal:int
	var ab_angle:float = line_ab.angle() + PI
	if (0.0 <= ab_angle and ab_angle < PI/2.0):
		a_use_diagonal = 2
		if (b_use_diagonal == 0):
			b_use_diagonal = 2
	elif (PI/2.0 <= ab_angle and ab_angle < PI):
		a_use_diagonal = 1
		if (b_use_diagonal == 0):
			b_use_diagonal = 1
	elif (PI <= ab_angle and ab_angle < PI*1.5):
		a_use_diagonal = 2
		if (b_use_diagonal == 0):
			b_use_diagonal = 2
	else:
		a_use_diagonal = 1
		if (b_use_diagonal == 0):
			b_use_diagonal = 1
	var all_using_points:Array = []
	all_using_points.append(Dictionary({angle = 0.0, point = a_diagonals[a_use_diagonal - 1].point_0}))
	all_using_points.append(Dictionary({angle = 0.0, point = a_diagonals[a_use_diagonal - 1].point_1}))
	all_using_points.append(Dictionary({angle = 0.3, point = b_diagonals[b_use_diagonal - 1].point_0}))
	all_using_points.append(Dictionary({angle = 0.3, point = b_diagonals[b_use_diagonal - 1].point_1}))
	for point in all_using_points:
		point.angle += Vector2(line_ab / 2.0).angle_to_point(point.point)
	all_using_points.sort_custom(
		func(a, b):
			return a.angle < b.angle
	)
	for x in all_using_points.size():
		_offset.polygon.resize(all_using_points.size())
		_offset.polygon.fill(Vector2(0.0, 0.0))
		_offset.polygon[x-1] = Vector2(all_using_points[x-1].point)

func set_shape(size:Vector2)->void:
	_shape_0.shape.size = size
	set_offset(_shape_1.position, _shape_1.rotation)

class diagonal:
	var point_0:Vector2
	var point_1:Vector2
	func _init(_point_0:Vector2, _point_1:Vector2):
		point_0 = _point_0
		point_1 = _point_1
