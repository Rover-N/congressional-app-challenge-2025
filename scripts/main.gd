extends Control

var events = []
var eventTitle

const eventMenuButton = preload("res://scenes/menu_button.tscn")

func _on_new_event_button_pressed() -> void:
	$ColorRect/NewEventButton/NewEventMenu.visible = !$ColorRect/NewEventButton/NewEventMenu.visible



func _on_save_changes_pressed() -> void:
	#First we should set placeholder values for everything so we know what we're working with
	var eventData = {
		"title" : "Placeholder Title",
		"description" : "Placeholder Description",
		"time" : Time.get_datetime_string_from_system() #YYYY-MM-DDTHH:MM:SS We are using system time as a placeholder
	}
	
	#We should use checks to make sure the new data is valid, here I make sure there is something typed
	if $ColorRect/NewEventButton/NewEventMenu/NewEventTitle.text != null and $ColorRect/NewEventButton/NewEventMenu/NewEventTitle.text != "":
		eventData["title"] = $ColorRect/NewEventButton/NewEventMenu/NewEventTitle.text
	
	#This should go after all data is set to what we want it to be
	events.append(eventData)
	
	var event = eventMenuButton.instantiate()
	$ColorRect/EventList.add_child(event)
