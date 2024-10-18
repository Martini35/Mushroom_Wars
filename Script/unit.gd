extends CharacterBody2D

@onready var head = $Body/Head
@onready var animacje = $AnimationPlayer

var speed = 50
var nation = 0
var desiny
var desX
var desY
var destinyBase

func _ready():
	pass
	
func _process(delta):
	change_nation()
	update_velocity()
	move_and_slide()
	
	

func set_destiny(des, nat, base):
	desiny = des
	nation = nat
	destinyBase = base
	
	
func change_nation():
	if nation == 1:
		head.self_modulate = Color(0, 255, 0)
	elif nation == 2:
		head.self_modulate = Color(255, 0, 0)


func update_velocity():
	var moveDirection = desiny - self.global_position
	velocity = moveDirection.normalized() * speed
	animacje.play("walk")
