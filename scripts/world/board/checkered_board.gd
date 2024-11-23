extends Board

@export var square_type_1: PackedScene
@export var square_type_2: PackedScene

func _ready() -> void:
	super._ready()
	
	var board_array := []
	
	# Place squares, alternate between types
	for i in range(board_dim_y):
		var row := []
		for j in range(board_dim_x):
			var square_node
			if (i%2==0 and j%2==0) or (i%2==1 and j%2==1) :
				square_node = square_type_1.instantiate()
			else:
				square_node = square_type_2.instantiate()
			square_node.name = "(" + str(i) + "," + str(j) + ")"
			row.append(square_node)
		board_array.append(row)
	
	# Make board using the provided array
	make_board(board_array)
	center_board()
	
	
