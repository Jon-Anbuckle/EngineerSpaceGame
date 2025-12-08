extends Control

signal finished(success)

@export var keyString: String = "!"
@export var keyCode: Key = KEY_Q
@export var eventDuration := 0.5
@export var displayDuration := 0.5

@onready var color_rect: ColorRect = %ColorRect
@onready var key_label: Label = %Label
@onready var success_label: Label = %Success_Label

var tween = create_tween()
var success = false

func _ready() -> void:
	print("DHAJND")
	visible = true
	add_to_group("QTE")
	key_label.text = keyString
	
	await _animation()
	
	if not success:
		hide()
		
func _animation():
	tween.tween_property(color_rect, "material:shader_parameter/;value" , 0, eventDuration)
	
	await tween.finished
	
func _input(event: InputEvent) -> void:
	pass
	#if Input.is_key_pressed(keyCode) and not success_label.visible:
		#success_label.show()
		#tween.kill()
		#success = true
		
		#await get_tree().create_timer(displayDuration).timeout
		
		#hide()


func _on_button_button_down() -> void:
	if not success_label.visible:
		success_label.show()
		tween.kill()
		success = true
			
		await get_tree().create_timer(displayDuration).timeout
			
		hide()
	pass # Replace with function body.

func _on_button_pressed()-> void:
	#QTEINT.position.x = randi_range(0,200)
	#$Button.position.x = QTEINT.position.x
	#$Button.position.y = QTEINT.position.y
	pass
