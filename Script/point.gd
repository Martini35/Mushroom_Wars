extends CharacterBody2D

@onready var kolor = $Sprite2D/Sprite2D
@onready var marker = $Marker2D
@onready var napis = $Label
@onready var timer = $Timer

@export var nation = 0
var unitInBase = 20


@onready var unit = preload("res://Scean/unit.tscn")


func _ready():
	kolor.self_modulate = Color(255, 255, 255)


func _process(delta):
	color_change()
		
	napis.text = str(unitInBase)


func changeNatrion(N):
	nation = N


func _on_area_2d_mouse_entered():
	Global.emit_signal("arrow", true, nation, self)


func _on_area_2d_mouse_exited():
	Global.emit_signal("arrow", false, -1, self)


func spawnUnit(ile, des, nat, basEn):
	for i in range(0, ile):
		await get_tree().create_timer(0.2).timeout
		var unit1 = unit.instantiate()
		unit1.position = marker.position
		unit1.set_destiny(des, nat, basEn)
		add_child(unit1)
		unitInBase -= 1


func _on_area_2d_body_entered(body):
	if body.nation != nation && self == body.destinyBase:
		if unitInBase == 0:
			nation = body.nation
			unitInBase += 1
		unitInBase -= 1
		body.queue_free()
	elif self == body.destinyBase:
		body.queue_free()
		unitInBase += 1
		

func color_change():
	if nation == 0:
		kolor.self_modulate = Color(255, 255, 255)
	elif nation == 1:
		kolor.self_modulate = Color(0, 255, 0)
	else:
		kolor.self_modulate = Color(255, 0, 0)

func coming_unit():
	unitInBase += 1


func _on_timer_timeout():
	coming_unit()
	timer.wait_time = 2
