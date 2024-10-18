extends Node2D

@onready var linia = $Line2D
@onready var base1 = $Point
@onready var base2 = $Point3

@onready var label = $Label

var pierwszyKlik = true
var arrow = false
var onOurBase = false
var natrion = 0
var baseFriend
var baseEnemy
var ile

func _ready():
	linia.add_point(Vector2(0, 0), 0)
	linia.add_point(Vector2(0, 0), 1)
	
	base1.changeNatrion(1)
	base2.changeNatrion(2)
	
	Global.connect("arrow", Callable(self, "_can_we"))
	
	ile = 1


func _process(delta):
	if Input.is_action_pressed("left_mouse"):
		if pierwszyKlik && arrow && natrion == 1:
			baseFriend = baseEnemy
			linia.set_point_position(0, Vector2(get_global_mouse_position()))
			pierwszyKlik = false
			onOurBase = true
			
		if !pierwszyKlik:
			linia.set_point_position(1, Vector2(get_global_mouse_position()))
		
	if Input.is_action_just_released("left_mouse"):
		if (natrion == 0 || natrion == 2 || natrion == 1) && onOurBase:
			baseFriend.spawnUnit(baseFriend.unitInBase * ile, baseEnemy.position, 1, baseEnemy)
		linia.set_point_position(0, Vector2(0, 0))
		linia.set_point_position(1, Vector2(0, 0))
		pierwszyKlik = true
		onOurBase = false
		baseFriend = null
		
	label.text = str(get_global_mouse_position())


func _can_we(can, nat, be):
	arrow = can
	natrion = nat
	baseEnemy = be



func _on_gui_zmina_ilosci(ilee):
	ile = ilee
