class_name Piece
extends Node2D

var is_draggable        := false
var is_inside_droppable := false
var droppable_body_ref
var initial_position    : Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if is_draggable:
		if Input.is_action_just_pressed("piece_pick_up"):
			initial_position = global_position
			EventBus.is_dragging = true
			
		if Input.is_action_pressed("piece_pick_up"):
			global_position = get_global_mouse_position()
			
		elif Input.is_action_just_released("piece_pick_up"):
			print(is_inside_droppable)
			EventBus.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self, "global_position", droppable_body_ref.global_position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initial_position, 0.2).set_ease(Tween.EASE_OUT)
			


func _on_area_2d_mouse_entered() -> void:
	if not EventBus.is_dragging:
		is_draggable = true
		scale = Vector2(1.05,1.05)


func _on_area_2d_mouse_exited() -> void:
	if not EventBus.is_dragging:
		is_draggable = false
		scale = Vector2(1,1)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("droppable"):
		print("body entered")
		is_inside_droppable = true
		#body.get_parent().highlight()
		droppable_body_ref = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("droppable"):
		print("body exited")
		is_inside_droppable = false
		#body.get_parent().reset_highlight()
		droppable_body_ref = body
