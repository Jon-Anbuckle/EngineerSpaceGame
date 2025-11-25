extends Node2D

@onready var DBDtimer = $Timer
@onready var my_scene_root = get_node("res://minigame.tscn")

func _ready() -> void:
	#visible = false
	#DBDtimer.wait_time = 5
	#DBDtimer.one_shot = true
	#DBDtimer.autostart = false
	
	pass

var detected = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	detected = true
	print("8")



func _on_area_2d_area_exited(area: Area2D) -> void:
	detected = false
	print("0")


func _on_button_pressed():
	if detected == true:
		print("7")
	elif detected == false:
		print("10")

func _Input(event):
	if event._on_button_pressed():
		print("676767676767767")
		pass
