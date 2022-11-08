extends Control

onready var gauge = $GaugeLevel
onready var gauge_fill_timer = $Timer

var max_height
var original_position
var random_growth_speed
var level = 0

export var gauge_input : String = ""
export var gauge_color : Color

func _ready():

	max_height = gauge.rect_size.y
	original_position = gauge.rect_position.y
	random_growth_speed = get_random_growth_speed()

	# Initialise empty
	gauge.rect_size.y = 0
	gauge.rect_position.y += gauge.rect_size.y

	for action in InputMap.get_action_list(gauge_input):
		# Assume there's only one possible, physical key, input
		$ColorRect3/Key.text = OS.get_scancode_string(action.physical_scancode)

	gauge.color = gauge_color


func _process(delta):

	if Globals.flying:
		# On every reset, change growth speeds
		if Input.is_action_just_pressed(gauge_input):
			level = 0
			random_growth_speed = get_random_growth_speed()
			gauge_fill_timer.stop()

		var fractional_height = (level * max_height)
		gauge.rect_size.y = fractional_height
		gauge.rect_position.y = original_position + max_height - fractional_height

		var growth_amount = random_growth_speed * delta

		if growth_amount > (1 - level):
			growth_amount = 0
			if gauge_fill_timer.is_stopped():
				gauge_fill_timer.start()

		level += growth_amount


func get_random_growth_speed() -> float:
	return rand_range(0.1,0.3)


func _on_Timer_timeout():
	Events.emit_signal("game_over", "A gauge got too high.")
