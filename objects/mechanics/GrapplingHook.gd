extends Node2D

const SNAP_DISTANCE = 5

export(Vector2) var bullet_speed = Vector2(500, 500)
export(int) var shot_distance = 300 setget set_shot_distance

var target_pos =  Vector2()
var shooting = false
var retrieving = false



func _ready():
	
	$Line2D.add_point(Vector2())


func _physics_process(_delta):
	if shooting or retrieving:
		var move_delta = $BulletBody.position.direction_to(target_pos) * \
		 bullet_speed * Vector2(_delta, _delta)
		if $BulletBody.position.distance_to(target_pos) > SNAP_DISTANCE:
			var collision = $BulletBody.move_and_collide(move_delta)
			if collision != null:
				shooting = false
				retrieving = false
		else:
			$BulletBody.position = target_pos
			shooting = false
			retrieving = false


func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed \
	 and event.button_index == BUTTON_LEFT:
		if !shooting and !retrieving:
			if $BulletBody.position == Vector2():
				shoot_hook(event.position - position)
			else:
				retrieve_hook()
	elif event is InputEventMouseMotion:
		$Pivot.rotation = event.position.angle_to_point(position)


func shoot_hook(_target_pos):
	shooting = true
	retrieving = false
	target_pos = $BulletBody.position.direction_to(_target_pos) * shot_distance
	$BulletBody/Collision.disabled = false


func retrieve_hook():
	shooting = false
	retrieving = true
	target_pos = Vector2()
	$BulletBody/Collision.disabled = true
	$Line2D.points = []
	$Line2D.add_point(Vector2())


func set_shot_distance(_shot_distance):
	shot_distance = _shot_distance
	$Pivot/RayCast2D.cast_to(Vector2(shot_distance, 0))
