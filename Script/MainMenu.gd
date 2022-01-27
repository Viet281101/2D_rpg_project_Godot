extends CanvasLayer

onready var settingmenu = load("res://Scene/MenuGlobal.tscn")
onready var soundmenu = load("res://Scene/Music_Sound_Menu.tscn")
var arrow_cursor = load("res://assets/Items/Mouse1.png")
export (NodePath) onready var start_1 = get_node(start_1) as AnimationPlayer
export (NodePath) onready var comment_lbl = get_node(comment_lbl) as Label
var check_key = false

func _ready():
	Input.set_custom_mouse_cursor(arrow_cursor)
	start_1.play("start")
	comment_lbl.visible = false
	if Global.see_credit == false:
		$Credit.visible = true
	elif Global.see_credit == true:
		$Credit.visible = false

func _process(_delta):
	if comment_lbl.visible == false and Global.see_credit == false:
		$CenterContainer/VBoxContainer/Quit.visible = true
	if comment_lbl.visible == true and Global.see_credit == false:
		$CenterContainer/VBoxContainer/Quit.visible = false
	if comment_lbl.visible == true and Global.see_credit == true:
		$CenterContainer/VBoxContainer/Quit.visible = true
	

func _on_Quit_pressed():
	queue_free()
	get_tree().quit()

func _on_Start_pressed():
	if check_key:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scene/Intro.tscn")
		Global.get_start = true
	else:
		comment_lbl.visible = true
		$Credit.rect_global_position.y = 242

func _on_Key_pressed():
	add_child(settingmenu.instance())
	check_key = true

func _on_Music_pressed():
	add_child(soundmenu.instance())

func _exit_tree():
	self.queue_free()

func _on_Credit_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scene/Credit.tscn")
	Global.play_music()
	Global.see_credit = true