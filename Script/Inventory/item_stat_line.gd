class_name Item_Info_Line extends Label

func _init( value, color ):
	text = value
	align = Label.ALIGN_CENTER
	valign = Label.VALIGN_CENTER
	set( "custom_fonts/font", RessourceManager.font[ 8 ] )
	set( "custom_colors/font_color", RessourceManager.colors[ color ] )
