extends Board

@export var square_type_1: PackedScene
@export var square_type_2: PackedScene

func _ready() -> void:
	super._ready()
	
	var board_array := []
	
	print("board_array")

	for i in range(board_dim_y):
		var row := []
		for j in range(board_dim_x):
			var node
			if (i%2==0 and j%2==0) or (i%2==1 and j%2==1) :
				node = square_type_1.instantiate()
			else:
				node = square_type_2.instantiate()
			node.name = "(" + str(i) + "," + str(j) + ")"
			row.append(node)
		board_array.append(row)
	make_board(board_array)
	
	
