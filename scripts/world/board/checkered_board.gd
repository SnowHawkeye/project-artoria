extends Board

@export var board_dim_x := 8
@export var board_dim_y := 8

@export var square_type_1: PackedScene
@export var square_type_2: PackedScene

func _ready() -> void:

	# Place squares, alternate between types
	for x in range(board_dim_y):
		var row := []
		for y in range(board_dim_x):
			var square_node
			if (x%2==0 and y%2==0) or (x%2==1 and y%2==1) :
				square_node = square_type_1.instantiate()
			else:
				square_node = square_type_2.instantiate()
			row.append(square_node)
		self.squares.append(row)
	
	make_board()
	
