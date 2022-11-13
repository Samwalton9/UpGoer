extends Camera2D

var screen_shake_amount : float = 0.0


func _physics_process(_delta):
	if Globals.flying:
		screen_shake_amount = Globals.shuttle.position.y/300

		var random_x = rand_range(0, screen_shake_amount)
		var random_y = rand_range(0, screen_shake_amount)

		offset = Vector2(random_x, random_y)
