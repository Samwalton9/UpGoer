extends TextureRect


func _physics_process(delta):
	if Globals.stage == 2:
		var distance_to_move = Globals.shuttle_speed * delta
		rect_position.y += distance_to_move

		# Once the top of the screen has been reached, on to stage 3
		if -rect_position.y < distance_to_move:
			Globals.stage = 3
	print(rect_position)
