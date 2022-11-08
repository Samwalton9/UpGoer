extends Control

var gauges
var gauge_fill_timers

var max_height = []
var original_position = []
var random_growth_speed = []
var level = [0, 0, 0]

func _ready():
	gauges = get_tree().get_nodes_in_group("Gauge")
	gauge_fill_timers = get_tree().get_nodes_in_group("GaugeFillTimer")

	for gauge_timer in gauge_fill_timers:
		gauge_timer.connect("timeout", self, "_on_gauge_timeout")

	for gauge in gauges:
		max_height.append(gauge.rect_size.y)
		original_position.append(gauge.rect_position.y)
		random_growth_speed.append(get_random_growth_speed())

		# Initialise empty
		gauge.rect_size.y = 0
		gauge.rect_position.y += gauge.rect_size.y


func _process(delta):

	# TODO: This is spaghetti. Should probably instance scenes for gauges
	if Globals.flying:
		# On every reset, change growth speeds
		if Input.is_action_just_pressed("gauge_one"):
			level[0] = 0
			random_growth_speed[0] = get_random_growth_speed()
			gauge_fill_timers[0].stop()
		if Input.is_action_just_pressed("gauge_two"):
			level[1] = 0
			random_growth_speed[1] = get_random_growth_speed()
			gauge_fill_timers[1].stop()
		if Input.is_action_just_pressed("gauge_three"):
			level[2] = 0
			random_growth_speed[2] = get_random_growth_speed()
			gauge_fill_timers[2].stop()

		for i in range(3):
			var fractional_height = (level[i] * max_height[i])
			gauges[i].rect_size.y = fractional_height
			gauges[i].rect_position.y = original_position[i] + max_height[i] - fractional_height

			var growth_amount = random_growth_speed[i] * delta

			if growth_amount > (1 - level[i]):
				growth_amount = 0
				if gauge_fill_timers[i].is_stopped():
					gauge_fill_timers[i].start()

			level[i] += growth_amount


func get_random_growth_speed() -> float:
	return rand_range(0.1,0.3)


func _on_gauge_timeout():
	Events.emit_signal("game_over", "A gauge got too high.")
