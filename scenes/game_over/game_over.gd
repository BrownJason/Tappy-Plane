extends Control

@onready var go_label = $GoLabel
@onready var space_label = $SpaceLabel
@onready var space_timer = $SpaceTimer
@onready var game_over_sound = $GameOverSound


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	space_label.hide()
	go_label.show()
	SignalManager.on_plane_death.connect(on_plane_death)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func run_sequence() -> void:
	space_label.show()
	go_label.hide()

func on_plane_death():
	show()
	space_timer.start()
	game_over_sound.play()
	

func _on_space_timer_timeout():
	run_sequence()
	
func _input(event):
	if space_label.visible && space_timer.is_stopped():
		if event.is_action_pressed("fly") || event is InputEventScreenTouch:
			GameManager.load_main_scene()
