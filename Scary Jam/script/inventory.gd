extends Control

@onready var button = $HBoxContainer/Button

func _on_button_pressed():
	if Global.player_shoot_resource > 0:
			Global.player_shoot_resource -= 1
			Global.player_shooots += 1

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		Global.player_node.can_move = false
		button.grab_focus()

func _on_quit_pressed():
	Global.player_node.can_move = true
	for button in get_node("HBoxContainer").get_children():
		button.release_focus()
