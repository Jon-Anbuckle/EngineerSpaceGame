extends Node2D

@onready var currency = 0
@onready var currency_text = $CanvasLayer/coin/Label
var QTE = load("res://scene/qte.tscn")
var QTEINT
var QTESTATE = false
var num 

func _ready() -> void:
	while QTESTATE == false:
		await get_tree().create_timer(1.0).timeout
		num = randi_range(1, 4)
		print(num)
		if num == 3:
			QTEINT = QTE.instantiate()
			add_child(QTEINT)
			QTESTATE = true
	pass

func _on_button_pressed() -> void:
	currency = currency + 1
	currency_text.text = "{0}".format([currency])
	QTEINT.position.x = randi_range(0,200)
	QTEINT.position.y = randi_range(0,200)
	$CanvasLayer/Button.position.x = QTEINT.position.x + 520
	$CanvasLayer/Button.position.y = QTEINT.position.y + 420

	
	
