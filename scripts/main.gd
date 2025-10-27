extends Control

var events = []
var eventTitle
var currentEvent

const eventMenuButton = preload("res://scenes/menu_button.tscn")

func _on_new_event_button_pressed() -> void:
	$ColorRect/NewEventButton/NewEventMenu.visible = !$ColorRect/NewEventButton/NewEventMenu.visible
	$ColorRect/NewEventButton/Shield.visible = $ColorRect/NewEventButton/NewEventMenu.visible 


func _on_save_changes_pressed() -> void:
	#First we should set placeholder values for everything so we know what we're working with
	var eventData = {
		"title" : "",
		"description" : "",
		"color" : "White",
		"time" : null
	}
	
	#We should use checks to make sure the new data is valid, here I make sure there is something typed
	if $ColorRect/NewEventButton/NewEventMenu/NewEventTitle.text != null and $ColorRect/NewEventButton/NewEventMenu/NewEventTitle.text != "":
		eventData["title"] = $ColorRect/NewEventButton/NewEventMenu/NewEventTitle.text
	
	if $ColorRect/NewEventButton/NewEventMenu/NewEventDesc.text != null and $ColorRect/NewEventButton/NewEventMenu/NewEventDesc.text != "":
		eventData["description"] = $ColorRect/NewEventButton/NewEventMenu/NewEventDesc.text
	
	if $ColorRect/NewEventButton/NewEventMenu/ColorList.get_selected_items().size() >= 1:
		eventData["color"] = $ColorRect/NewEventButton/NewEventMenu/ColorList.get_item_text($ColorRect/NewEventButton/NewEventMenu/ColorList.get_selected_items()[0])
	
	#This should go after all data is set to what we want it to be
	events.append(eventData)
	
	var event = eventMenuButton.instantiate()
	
	event.menu_opened.connect(close_all)
	
	#Start to update UI
	event.get_node("Screen/EventMenuShow/Title").text = eventData["title"]
	event.get_node(".").text = eventData["title"]
	event.get_node(eventData["color"]).visible = true
	event.get_node("Screen/EventMenuShow/Desc").text = eventData["description"]
	
	$ColorRect/EventList.add_child(event)
	$ColorRect/NewEventButton/NewEventMenu.visible = false
	$ColorRect/NewEventButton/Shield.visible = $ColorRect/NewEventButton/NewEventMenu.visible 

func close_all(buttonIndex):
	for child in $ColorRect/EventList.get_children():
		if child.get_index() != buttonIndex:
			child.get_child(0).get_child(0).visible = false


func _on_none_pressed() -> void:
	for event in $ColorRect/EventList.get_children():
		event.visible = true


func _on_blue_pressed() -> void:
	for event in $ColorRect/EventList.get_children():
		for child in event.get_children():
			if child.name == "Blue":
				if child.visible == true:
					event.visible = true
				else:
					event.visible = false


func _on_green_pressed() -> void:
	for event in $ColorRect/EventList.get_children():
		for child in event.get_children():
			if child.name == "Green":
				if child.visible == true:
					event.visible = true
				else:
					event.visible = false


func _on_yellow_pressed() -> void:
	for event in $ColorRect/EventList.get_children():
		for child in event.get_children():
			if child.name == "Yellow":
				if child.visible == true:
					event.visible = true
				else:
					event.visible = false

func _on_orange_pressed() -> void:
	for event in $ColorRect/EventList.get_children():
		for child in event.get_children():
			if child.name == "Orange":
				if child.visible == true:
					event.visible = true
				else:
					event.visible = false


func _on_red_pressed() -> void:
	for event in $ColorRect/EventList.get_children():
		for child in event.get_children():
			if child.name == "Red":
				if child.visible == true:
					event.visible = true
				else:
					event.visible = false


func _on_purple_pressed() -> void:
	for event in $ColorRect/EventList.get_children():
		for child in event.get_children():
			if child.name == "Purple":
				if child.visible == true:
					event.visible = true
				else:
					event.visible = false


func _on_shield_pressed() -> void:
	$ColorRect/NewEventButton/NewEventMenu.visible = false
	$ColorRect/NewEventButton/Shield.visible = $ColorRect/NewEventButton/NewEventMenu.visible 


func _on_white_pressed() -> void:
	for event in $ColorRect/EventList.get_children():
		for child in event.get_children():
			if child.name == "White":
				if child.visible == true:
					event.visible = true
				else:
					event.visible = false
