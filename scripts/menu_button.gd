extends Button

signal menu_opened(buttonIndex: int)

func _pressed():
	menu_opened.emit(get_index())
	$Screen/EventMenuShow.visible = !$Screen/EventMenuShow.visible
	
