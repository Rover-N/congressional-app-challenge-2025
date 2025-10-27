extends Button

signal menu_opened(buttonIndex: int)

func _pressed():
	menu_opened.emit(get_index())
	$Screen/EventMenuShow.visible = !$Screen/EventMenuShow.visible
	


func _on_remove_pressed() -> void:
	queue_free()


func _on_close_pressed() -> void:
	$Screen/EventMenuShow.visible = !$Screen/EventMenuShow.visible
