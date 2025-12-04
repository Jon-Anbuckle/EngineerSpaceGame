extends Node2D
var socket := WebSocketPeer.new()
var server_ip := "10.184.1.88"
var role = "engineer"
var team = "tech"
var connectionscene = load("res://controlpad.tscn")
var connectioninstant
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if not global_client_TEngineer.connected:
		global_client_TEngineer.server_connect(server_ip, role, team)
		connectioninstant = connectionscene.instantiate()
		add_child(connectioninstant)
