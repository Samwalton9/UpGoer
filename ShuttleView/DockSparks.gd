extends GPUParticles2D

@onready var waitTimer = $ParticleWaitTimer
@onready var particleTimer = $ParticleTimer


func _ready():
	if Globals.restarted:
		start_timers()

	Events.connect("game_start", Callable(self, "_on_game_start"))


func start_timers():
	waitTimer.start()
	particleTimer.start()

func _on_game_start():
	start_timers()


func _on_ParticleWaitTimer_timeout():
	emitting = true


func _on_ParticleTimer_timeout():
	emitting = false
