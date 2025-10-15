extends Button

func _button_down():
	$EventMenuShow.visible = !$EventMenuShow.visible
