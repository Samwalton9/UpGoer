extends Control

var gauges

var max_height = []
var original_position = []
var random_growth_speed = []
var level = [0, 0, 0]

func _ready():
	gauges = get_tree().get_nodes_in_group("Gauge")

	for gauge in gauges:
		max_height.append(gauge.rect_size.y)
		original_position.append(gauge.rect_position.y)
		random_growth_speed.append(get_random_growth_speed())

		# Initialise empty
		gauge.rect_size.y = 0
		gauge.rect_position.y += gauge.rect_size.y


func _process(delta):

	if Globals.flying:
		if Input.is_action_just_pressed("gauge_one"):
			level[0] = 0
			random_growth_speed[0] = get_random_growth_speed()
		if Input.is_action_just_pressed("gauge_two"):
			level[1] = 0
			random_growth_speed[1] = get_random_growth_speed()
		if Input.is_action_just_pressed("gauge_three"):
			level[2] = 0
			random_growth_speed[2] = get_random_growth_speed()

		for i in range(3):
			var fractional_height = (level[i] * max_height[i])
			gauges[i].rect_size.y = fractional_height
			gauges[i].rect_position.y = original_position[i] + max_height[i] - fractional_height

			var growth_amount = random_growth_speed[i] * delta
			level[i] += growth_amount

			if growth_amount > (1 - level[i]):
				Events.emit_signal("game_over", "A gauge got too high.")


func get_random_growth_speed() -> float:
	return rand_range(0.1,0.3)
