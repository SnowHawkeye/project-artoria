extends Control

@onready var rectangle = $ColorRect
@onready var static_body_2d: StaticBody2D = $StaticBody2D
@onready var collision_shape: CollisionShape2D = $StaticBody2D/CollisionShape2D

func _ready() -> void:
	resize_collision_shape()


func _on_resized() -> void:
	resize_collision_shape()


func resize_collision_shape():
	if collision_shape.shape and collision_shape.shape is RectangleShape2D:
		collision_shape.shape.extents = rectangle.size/2
		collision_shape.position = rectangle.position + rectangle.size / 2
		


func highlight():
	static_body_2d.modulate = Color(Color.AQUAMARINE, 0.5)
	
	
func remove_highlight():
	static_body_2d.modulate = Color(Color.AQUAMARINE, 0)
