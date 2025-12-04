extends Node2D

@onready var DBDtimer = $Timer
@onready var my_scene_root = get_node("res://minigame.tscn")
@onready var minstant = get_node("res://slider.gd")

func _ready() -> void:
	visible = true
	DBDtimer.start()
	pass

var detected_small = false
var detected_big = false

func _on_area_2d_area_entered(_area: Area2D) -> void:
	detected_big = true
	print("8")



func _on_area_2d_area_exited(_area: Area2D) -> void:
	detected_big = false
	print("0")

func _on_button_button_down() -> void:
	if detected_big:
		get_parent().charge += 2
	elif detected_small:
		get_parent().charge += 1
	else:
		print("10")
	get_parent().minigame_status = false
	queue_free()


func _on_timer_timeout() -> void:
	get_parent().minigame_status = false
	queue_free()


func _on_little_area_area_entered(_area: Area2D) -> void:
	detected_small = true
	print("17")


func _on_little_area_area_exited(_area: Area2D) -> void:
	detected_small = false
	print("18")
