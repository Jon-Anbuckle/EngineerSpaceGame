extends Control

@onready var timer: Timer = $Timer

const QTE = preload("res://scene/qte.tscn")

#var keyList = [
	#{"keyString": "Q", "keyCode": KEY_Q},"
	#{"keyString": "E", "keyCode": KEY_E},"
	#{"keyString": "E", "keyCode": KEY_E},"
	#{"keyString": "Q", "keyCode": KEY_Q},"
	#{"keyString": "Q", "keyCode": KEY_E},
	#{"keyString": "E", "keyCode": KEY_E},
	#{"keyString": "E", "keyCode": KEY_E},
#	{"keyString": "Q", "keyCode": KEY_Q},
#]

var count = 0 
var keyPressedList = []


func _on_timer_timeout() -> void:
	#if count == keyList():
		#timer.stop()
		#return
	
	var keyNode = QTE.instantiate()
	keyNode.finished.connect(_on_key_finished)
	#keyNode.keyCode = keyList[count].keycode
	#keyNode.keyString = keyList[count].keyString
	
	add_child(keyNode)
	
	count += 1
	
func _on_key_finished(keySucess):
	print("KDJAKDKJA")
	keyPressedList.append(keySucess)
	get_parent().currency = get_parent().currency + 1
	get_parent().currency_text.text = "{0}".format([get_parent().currency])
	get_parent().QTE_STATE = false
