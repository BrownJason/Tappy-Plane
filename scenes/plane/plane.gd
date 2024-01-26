extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var engine_sound = $EngineSound

const GRAVITY: float = 1500.0
const POWER: float = -500.0

func _ready():
	pass

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	move_and_slide()
	
	if is_on_floor():
		die()
		

func _input(event):
	if event.is_action_pressed("fly") || event is InputEventScreenTouch:
		if event.is_pressed():
			velocity.y = POWER
			animation_player.play("power")

func die() -> void:
	sprite.stop()
	set_physics_process(false)
	SignalManager.on_plane_death.emit()
	engine_sound.stop()
