extends CharacterBody2D

@onready var kolor = $Sprite2D/Sprite2D

var nation = 0

func _ready():
	kolor.self_modulate = Color(255, 255, 255)


func _process(delta):
	if nation == 0:
		kolor.self_modulate = Color(255, 255, 255)
	elif nation == 1:
		kolor.self_modulate = Color(0, 255, 0)
	else:
		kolor.self_modulate = Color(255, 0, 0)
		

func changeNatrion(N):
	nation = N


func _on_area_2d_mouse_entered():
	Global.emit_signal("arrow", true, nation)


func _on_area_2d_mouse_exited():
	Global.emit_signal("arrow", false, 0)
