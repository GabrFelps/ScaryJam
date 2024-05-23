extends CanvasLayer

@onready var shoot_resource_label = $shoot_resource/shoot_resource_label
@onready var life_resource_label = $life_resource/life_resource_label
@onready var life_rect = $life/life_rect
@onready var shoot_rect = $shoot/shoot_rect
@onready var invasion_rect = $invasion/invasion_rect
@onready var invasion = $invasion


func _ready():
	Global.hud_node = self

func _process(_delta):
	update_player_shoot_label()
	update_time_to_invasion_rect()
	update_player_life_label()
	update_shoot_resource_label()
	show_invasion_label()

func update_player_shoot_label() -> void:
	shoot_rect.custom_minimum_size.x = Global.player_shooots * 10

func update_time_to_invasion_rect() -> void:
	invasion_rect.custom_minimum_size.x = Global.invasion_rect_factor

func update_player_life_label() -> void:
	life_rect.custom_minimum_size.x = Global.player_life * 30

func update_shoot_resource_label() -> void:
	shoot_resource_label.text =  str(Global.player_shoot_resource)

func update_life_resource_label() -> void:
	life_resource_label.text = str(Global.player_life_resource)

func show_invasion_label() -> void:
	if get_tree().current_scene.name == "house":
		invasion.visible = true
	else:
		invasion.visible = false
