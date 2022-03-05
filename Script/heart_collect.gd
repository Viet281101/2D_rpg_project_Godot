extends Node2D

onready var animated = $AnimatedSprite

func _ready():
	animated.play("collect")
	yield(animated, "animation_finished")

func colleted_finished():
	queue_free()

func _on_AnimatedSprite_animation_finished(_anim_name):
	queue_free()


