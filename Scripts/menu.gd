extends Control

var nice_text := preload("res://scenes/nice.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayer.connected_to_server.connect(joined_server)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_host_button_pressed():
	MultiplayerManager.make_multiplayer_server()
	load_level()
	pass # Replace with function body.

func _on_join_button_pressed():
	$Ip_config.show()
	pass # Replace with function body.


func _on_ip_config_confirmed():
	# allow joining on arbitrary port
	
	var remote_text = (%ip.text).strip_edges()
	var parts = remote_text.split(":")
	
	if parts.size() > 1:
		MultiplayerManager.connect_to_ip_as_client(parts[0], int(parts[1]))
	else:
		MultiplayerManager.connect_to_ip_as_client(remote_text)
		
	
	pass # Replace with function body.
	
func joined_server():
	load_level()
	
func load_level():
	get_tree().change_scene_to_file("res://scenes/level.tscn")
	
	


func _on_hidden_button_pressed():
	#print("nice")
	
	var nice = nice_text.instantiate()
	$loc.add_child(nice)
	
	pass # Replace with function body.
