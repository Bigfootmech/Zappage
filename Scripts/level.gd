extends Node2D

var PLAYER_SCENE := preload("res://units/player.tscn")

var SPAWN_DIST := 5.0


# Called when the node enters the scene tree for the first time.
func _ready():
	if not multiplayer.is_server():
		return

	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(remove_player)

	# Spawn already connected players.
	
	# print("peers:")
	# print(multiplayer.get_peers())
	
	for id in multiplayer.get_peers():
		add_player(id)
	
	add_player(1)
	
	pass 


func _exit_tree():
	if not multiplayer.is_server():
		return
	multiplayer.peer_connected.disconnect(add_player)
	multiplayer.peer_disconnected.disconnect(remove_player)

func add_player(id: int):
	var player_character = PLAYER_SCENE.instantiate()
	
	player_character.name = str(id) # rename node to ID
	player_character.player_id = id
	#player_character.set_input_authority(id)
	
	# Randomize character position.
	var rand_dir_pos := Vector2.from_angle(randf() * 2 * PI)
	var scaled = Vector2(rand_dir_pos.x * SPAWN_DIST, rand_dir_pos.y * SPAWN_DIST)
	player_character.position = scaled #+ get_main_char_pos()
	
	$Players.add_child(player_character, true)

	#player_character.set_input_authority(id)
	#print("multiplay id: " + str(multiplayer.get_unique_id()) + "given authority to " + str(id))
	
	#player_character.input.say_auth()
	
func remove_player(id: int):
	if not $Players.has_node(str(id)):
		return
	$Players.get_node(str(id)).queue_free()

func get_main_char_pos():
	var cha = get_main_char()
	
	if(cha):
		return cha.position
	else:
		return Vector2()

func get_main_char():
	return $"Players/1"
