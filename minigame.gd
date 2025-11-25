extends Node2D

@onready var DBDtimer = $Timer
@onready var my_scene_root = get_node("res://minigame.tscn")
@onready var minstant = get_node("res://slider.gd")
func _ready() -> void:
	visible = true
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

func _on_button_button_down() -> void:
	if detected == true:
		global_client_TEngineer.ship["total_power"] += 2
		print(global_client_TEngineer.ship["total_power"])
		
	elif detected == false:
		print("10")
