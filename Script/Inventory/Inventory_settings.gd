extends Window

export (NodePath) onready var scale_slider = get_node(scale_slider) as HSlider
export (NodePath) onready var fullscreen_check = get_node(fullscreen_check) as CheckBox
export( NodePath ) onready var lbl_min = get_node( lbl_min ) as Label
export( NodePath ) onready var lbl_max = get_node( lbl_max ) as Label

func _ready():
	fullscreen_check.pressed = SettingsManger.fullscreen
	lbl_min.text = "Min: %s" % scale_slider.min_value
	lbl_max.text = "Max: %s" % scale_slider.max_value

func _on_scale_slider_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		SettingsManger.scale = scale_slider.value

func _on_CheckBox_toggled(button_pressed):
	SettingsManger.fullscreen = button_pressed
