extends Node2D
var socket := WebSocketPeer.new()


#Change these variables as needed
var minigame_status = false
var charge = 0
var immobalized = false

var minigamething = load("res://minigame.tscn")
var new_minigame

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if str(global_client_TEngineer.ship["available_power"]) != $Control/Power_Supply.text:
		$Control/Pilot.value = global_client_TEngineer.ship["pilot_power"]
		$Control/Science.value = global_client_TEngineer.ship["science_power"]
		$Control/Shooter.value = global_client_TEngineer.ship["weapon_power"]
		$Control/Power_Supply.text = str(global_client_TEngineer.ship["available_power"])
	$Charge.text = str(charge)
	if immobalized == true:
		await get_tree().create_timer(4.0).timeout
		immobalized = false
		print("Back in action!")
	
	if not global_client_TEngineer.connected:
		queue_free()
func _exit_tree() -> void:
	socket.close()
	
	

# Called when the node enters the scene tree for the first time.
	   

#func _on_v_slider_value_changed(value: int) -> void:
	#var power = value
	#var message = "Pilot: {0}0%".format([power])
	#print(message)
	#Pilot_Power.text = "Pilot Power: {0}0%".format([power])
	#if value < Power_Supply:
		#print("Slider value is decreasing!")
		#Power_Supply = Power_Supply + 1
		#Power_Supply_Text.text = "Power Supply: {0}".format([Power_Supply])
		#print(Power_Supply)
	#elif value > Power_Supply:
		#print("Slider value is increasing!")
		#Power_Supply = Power_Supply - 1
		#Power_Supply_Text.text = "Power Supply: {0}".format([Power_Supply])
		#print(Power_Supply)
	#pass # Replace with function body.



#func _on_v_slider_2_value_changed(value: int) -> void:
	#var power = value
	#var message = "Science: {0}0%".format([power])
	#print(message)
	#Pilot_Power.text = "Science Power: {0}0%".format([power])
	#pass # Replace with function body.


#func _on_v_slider_3_value_changed(value: int) -> void:
	#var power = value
	#var message = "Shooter: {0}0%".format([power])
	#print(message)
	#Pilot_Power.text = "Shooter Power: {0}0%".format([power])
	#pass # Replace with function body.

#The following two functions allow for power levels to be adjusted according
#To the rules. These aren't elegant, but they work.



func _on_pilot_value_changed(value: float) -> void:
	if global_client_TEngineer.ship["pilot_power"] < value and int($Control/Power_Supply.text) >= 1:
		global_client_TEngineer.power("up", "pilot")
	elif global_client_TEngineer.ship["pilot_power"] > value:
		global_client_TEngineer.power("down", "pilot")
	else:
		$Control/Pilot.value = global_client_TEngineer.ship["pilot_power"]


#func _on_button_pressed() -> void:
	#global_client_TEngineer.server_connect(server_ip, role, team)


func _on_button_2_pressed() -> void:
	if charge >= 10 and not immobalized:
		global_client_TEngineer.overcharge()
		print("L")
		charge -= 10
		immobalized = true

func _on_button_3_pressed() -> void:
	if charge >= 10 and not immobalized:
		charge -= 10
		global_client_TEngineer.special()


func _on_science_value_changed(value: float) -> void:
	if global_client_TEngineer.ship["science_power"] < value and int($Control/Power_Supply.text) >= 1:
		global_client_TEngineer.power("up", "science")
	elif global_client_TEngineer.ship["science_power"] > value:
		global_client_TEngineer.power("down", "science")
	else:
		$Control/Science.value = global_client_TEngineer.ship["science_power"]



func _on_shooter_value_changed(value: float) -> void:
	if global_client_TEngineer.ship["weapon_power"] < value and int($Control/Power_Supply.text) >= 1:
		global_client_TEngineer.power("up", "weapons")
	elif global_client_TEngineer.ship["weapon_power"] > value:
		global_client_TEngineer.power("down", "weapons")
	else:
		$Control/Shooter.value = global_client_TEngineer.ship["weapon_power"]


func _on_button_4_pressed() -> void:
	if not minigame_status and not immobalized and charge < 20:
		new_minigame = minigamething.instantiate()
		add_child(new_minigame)
		minigame_status = true
