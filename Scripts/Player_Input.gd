extends MultiplayerSynchronizer

# Synchronized property.
@export var movedir := Vector2()
@export var lookat : float = 0.0
@export var shooting : bool = false

const debug = false

# Called when the node enters the scene tree for the first time.
func _ready():
	say_auth()
	set_process(am_i_owner())
	
	pass # Replace with function body.
	
func am_i_owner():
	return get_multiplayer_authority() == multiplayer.get_unique_id()
	
# 'Bugfix': if Dual-Windowing, don't wiggle both controllers with one mouse
func _notification(what):
	match what:
		MainLoop.NOTIFICATION_APPLICATION_FOCUS_OUT:
			#print("multiplayer id = " + str(multiplayer.get_unique_id()) + " Window unfocused")
			set_process(false)
			pass
		MainLoop.NOTIFICATION_APPLICATION_FOCUS_IN:
			#print("multiplayer id = " + str(multiplayer.get_unique_id()) + " Window focused")
			set_process(am_i_owner())
			pass

func say_auth():
	if debug:
		print("multiplayer id = " + str(multiplayer.get_unique_id()) + ", character id = " + str(get_parent().player_id) +  ". Input authority = " + str(get_multiplayer_authority()))
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(multiplayer.get_unique_id() == get_multiplayer_authority()):
		
		var parent_mousepos = get_parent().get_global_mouse_position()
		var parent_pos = get_parent().global_position
		var vector_look = parent_mousepos - parent_pos;
		
		var angle = atan2(vector_look.y, vector_look.x)
			
		lookat = angle
		
		shooting = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
		
		movedir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		
	
	if (debug && get_multiplayer_authority() != 1 && multiplayer.get_unique_id() == 1):
		print("procesing input for character " + str(get_parent().player_id) + " on machine = " + str(multiplayer.get_unique_id()))
		print(movedir)
		print(lookat)
		print(shooting)
	
	
	pass
