extends Control

@onready var ramka1 = $NinePatchRect
@onready var ramka2 = $NinePatchRect2
@onready var ramka3 = $NinePatchRect3
@onready var ramka4 = $NinePatchRect4

signal zminaIlosci(ile)

func _ready():
	ramka1.visible = true
	ramka2.visible = false
	ramka3.visible = false
	ramka4.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("1"):
		ramka1.visible = true
		ramka2.visible = false
		ramka3.visible = false
		ramka4.visible = false
		zminaIlosci.emit(1)
	if Input.is_action_just_pressed("2"):
		ramka1.visible = false
		ramka2.visible = true
		ramka3.visible = false
		ramka4.visible = false
		zminaIlosci.emit(0.75)
	if Input.is_action_just_pressed("3"):
		ramka1.visible = false
		ramka2.visible = false
		ramka3.visible = true
		ramka4.visible = false
		zminaIlosci.emit(0.5)
	if Input.is_action_just_pressed("4"):
		ramka1.visible = false
		ramka2.visible = false
		ramka3.visible = false
		ramka4.visible = true
		zminaIlosci.emit(0.25)


func _on_button_1_pressed():
	zminaIlosci.emit(1)
	ramka1.visible = true
	ramka2.visible = false
	ramka3.visible = false
	ramka4.visible = false


func _on_button_2_pressed():
	zminaIlosci.emit(0.75)
	ramka1.visible = false
	ramka2.visible = true
	ramka3.visible = false
	ramka4.visible = false


func _on_button_3_pressed():
	zminaIlosci.emit(0.5)
	ramka1.visible = false
	ramka2.visible = false
	ramka3.visible = true
	ramka4.visible = false


func _on_button_4_pressed():
	zminaIlosci.emit(0.25)
	ramka1.visible = false
	ramka2.visible = false
	ramka3.visible = false
	ramka4.visible = true
