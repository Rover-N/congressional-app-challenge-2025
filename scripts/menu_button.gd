extends Button

func _pressed():
	$Screen/EventMenuShow.visible = !$Screen/EventMenuShow.visible
