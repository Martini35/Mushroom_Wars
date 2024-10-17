extends Node2D

@onready var linia = $Line2D
@onready var base1 = $Point

var pierwszyKlik = true
var arrow = false
var natrion = 0

func _ready():
	linia.add_point(Vector2(0, 0), 0)
	linia.add_point(Vector2(0, 0), 1)
	
	base1.changeNatrion(1)
	
	Global.connect("arrow", Callable(self, "_can_we"))


func _process(delta):
	if Input.is_action_pressed("left_mouse"):
		if pierwszyKlik && arrow && natrion == 1:
			linia.set_point_position(0, Vector2(get_global_mouse_position()))
			pierwszyKlik = false
			
		if !pierwszyKlik:
			linia.set_point_position(1, Vector2(get_global_mouse_position()))
		
	if Input.is_action_just_released("left_mouse"):
		linia.set_point_position(0, Vector2(0, 0))
		linia.set_point_position(1, Vector2(0, 0))
		pierwszyKlik = true


func _can_we(can, nat):
	arrow = can
	natrion = nat
