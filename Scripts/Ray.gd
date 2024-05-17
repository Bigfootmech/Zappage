extends RayCast2D

#var is_casting := false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
#	%Shoot_Effects.points[1] = Vector2.ZERO
	
	pass # Replace with function body.
	
#func _unhandled_input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		#set_is_casting(event.pressed)
#		pass

#func set_is_casting(cast: bool) -> void:
#	is_casting = cast
#	
#	if is_casting:
#	#	appear()
#		%Shoot_Effects.show()
#	else:
#	#	disappear()
#		%Shoot_Effects.hide()
#	
#	set_physics_process(is_casting)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
#	var cast_point := target_position
	force_raycast_update()
	
	if is_colliding():
#		cast_point = to_local(get_collision_point())
		var obj = get_collider()
		# print(obj)
		obj.queue_free()
	
#	%Shoot_Effects.points[1] = cast_point
	
	pass

#func appear() -> void:
#	$Tween.stop_all()
#	$Tween.interpolate_property(%Shoot_Effects, "width", 0, 10.0, 0.2)
#	$Tween.start()

#func disappear() -> void:
#	$Tween.stop_all()
#	$Tween.interpolate_property(%Shoot_Effects, "width", 10.0, 0, 0.1)
#	$Tween.start()
