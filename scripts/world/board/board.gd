extends GridContainer

func _ready() -> void:
	const BLACK_SQUARE = preload("res://scenes/world/square/black_square.tscn")
	const WHITE_SQUARE = preload("res://scenes/world/square/white_square.tscn")
	
	print(BLACK_SQUARE)
	
	var array := []
	var board_size = 8
	
	columns = board_size
	for i in range(board_size):
		var row := []
		for j in range(board_size):
			var node
			if (i%2==0 and j%2==0) or (i%2==1 and j%2==1) :
				node = BLACK_SQUARE.instantiate()				
			else:
				node = WHITE_SQUARE.instantiate()
			node.name = "(" + str(i) + "," + str(j) + ")"
			row.append(node)
		array.append(row)
	make_board(array)


func make_board(squares):
	for x in squares:
		for y in x:
			add_child(y)
			
