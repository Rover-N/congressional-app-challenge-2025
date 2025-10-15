extends Control

var events = []
var eventTitle


const eventMenuButton = preload("res://scenes/menu_button.tscn")

func _on_new_event_button_pressed() -> void:
	$ColorRect/NewEventButton/NewEventMenu.visible = !$ColorRect/NewEventButton/NewEventMenu.visible



func _on_save_changes_pressed() -> void:
	eventTitle = $ColorRect/NewEventButton/NewEventMenu/NewEventTitle.text
	print("Changes Saved")
	var eventOne = eventMenuButton.instantiate()
	$ColorRect/EventList.add_child(eventOne)
