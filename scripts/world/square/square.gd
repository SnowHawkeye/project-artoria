class_name Square
extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	pass

func highlight():
	modulate = Color(Color.AQUAMARINE, 0.5)
	
func remove_highlight():
	modulate = Color(Color.AQUAMARINE, 0)

func get_dimension():
	return sprite_2d.texture.get_width() * sprite_2d.scale * scale
