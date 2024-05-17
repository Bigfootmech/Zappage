extends CharacterBody2D

const SPEED = 300.0

@export
var player_id = 2 :
	set(id):
		player_id = id
		# Give authority over the player input to the appropriate peer.
		$Player_Input.set_multiplayer_authority(id)
		
@onready var input = $Player_Input

func set_input_authority(id):
		$Player_Input.set_multiplayer_authority(id)
	
func is_this_player():
	return player_id == multiplayer.get_unique_id()
	
func _enter_tree():
#	$Player_Input.set_multiplayer_authority(player_id)
	pass
	
func _ready():
	# print("multiplay id: " + str(multiplayer.get_unique_id()) + ". playerID entered: " + str(player_id))
	
	if is_this_player():
		# print("multiplay id: " + str(multiplayer.get_unique_id()) + " connected to cam player: " + str(player_id))
		$Camera2D.make_current()
		
func _physics_process(_delta):
		
	#if !is_this_player():
	#	return
	
	#print("multiplay id: " + str(multiplayer.get_unique_id()))
	#input.say_auth()
	
	%Shoot_Effects.visible = input.shooting
	%RayCast2D.set_physics_process(input.shooting)
	
	
	rotation = input.lookat
	#look_at(get_global_mouse_position())
	
	var direction = input.movedir.normalized()
	#var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)



	move_and_slide()
