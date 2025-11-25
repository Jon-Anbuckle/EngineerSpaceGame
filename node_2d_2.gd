extends Node2D


@onready var shapeposition = $Polygon2D3
var shaperotation = 0


func _ready() -> void:
	pass
	shaperotation = randi_range(-180, 180)
	rotation += shaperotation
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
