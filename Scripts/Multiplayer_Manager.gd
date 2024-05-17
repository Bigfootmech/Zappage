extends Node


var SERVER_PORT_COPY_STEAM = 27003

# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayer.peer_connected.connect(player_connected)
	multiplayer.connection_failed.connect(connection_failed)
	pass # Replace with function body.

func player_connected(id):
	# print("player connected " + str(id))
	pass
	
func connection_failed(something = "no_err_msg"):
	#print("connection failed")
	print("connection failed " + str(something))
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func connect_to_ip_as_client(IP_ADDRESS, port = SERVER_PORT_COPY_STEAM):
	var peer = ENetMultiplayerPeer.new()
	#var peer = WebRTCMultiplayerPeer.new()
	var err = peer.create_client(IP_ADDRESS, port)
	
	print(err)
	print(peer.get_connection_status())
	
	multiplayer.multiplayer_peer = peer
	
func make_multiplayer_server(port = SERVER_PORT_COPY_STEAM):
	
	var peer = ENetMultiplayerPeer.new()
	#var peer = WebRTCMultiplayerPeer.new()
	peer.create_server(port)
	multiplayer.multiplayer_peer = peer
	
	#upnp_listen()
	
func upnp_listen():
	var upnp = UPNP.new()
	upnp.discover()
	upnp.add_port_mapping(SERVER_PORT_COPY_STEAM)
	
