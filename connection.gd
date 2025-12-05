extends Node2D
var socket := WebSocketPeer.new()
var server_ip 
var role = "engineer"
var team = "tech"
var connectionscene = load("res://controlpad.tscn")
var connectioninstant
@onready var textthing = $TextEdit
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



func _on_text_edit_text_changed() -> void:
	#server_ip = textthing.text
	#print(server_ip)
	pass
