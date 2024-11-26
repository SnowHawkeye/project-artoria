class_name Board
extends Node2D

var square_dimensions: Vector2 = Vector2(32,32)
@export var square_size:int=32:
	get:
		return square_dimensions.x
	set(value):
		square_dimensions = Vector2(value, value)

var squares: Array = []
	
func make_board():
	
	# position reference is the top left corner of the board
	var initial_position = global_position + square_dimensions/2 
	var current_position = initial_position
	
	# first loop to add children to the tree
	for x in range(squares.size()):
		for y in range(squares[x].size()):
			var square = squares[x][y]
			add_child(square)
			if Engine.is_editor_hint():
				square.set_owner(self)
	
	# make sure textures are loaded
	await get_tree().process_frame
	# squares are assumed to all have the same dimensions
	var square_sprite_size = squares[0][0].get_dimension()
	
	# place and setup squares
	for x in range(squares.size()):
		for y in range(squares[x].size()):
			var square = squares[x][y]
			
			square.name = "("+ str(x) + "," + str(y)+ ")"
			square.global_position = current_position
			
			square.scale = square_dimensions / square_sprite_size
			current_position.x += square_dimensions.x
		
		current_position.x = initial_position.x # reset x for next row
		current_position.y += square_size # increment y for next row
