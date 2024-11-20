class_name Board
extends Control

@export var board_dim_x := 8
@export var board_dim_y := 8
@export var square_size := 32 # px

@onready var grid: GridContainer = $Grid

func _ready() -> void:
	grid.custom_minimum_size = Vector2(board_dim_x * square_size, board_dim_y * square_size)
	grid.columns = board_dim_x

func make_board(squares):
	for x in squares:
		for y in x:
			grid.add_child(y)
	center_board()
	
func center_board():
	grid.position = size / 2  # Center grid in the parent
