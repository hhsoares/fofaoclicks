extends Node2D

@onready var points_label: Label = $PointsLabel

@onready var kwid: AnimatableBody2D = $kwid

const UPGRADE_COST := 10

func _ready() -> void:
	update_points_label()
	kwid.visible = false

func _on_texture_button_pressed() -> void:
	if Global.points >= UPGRADE_COST:
		Global.points -= UPGRADE_COST
		Global.points_per_second += 1.0
		Global.points_per_click += 1.0
		kwid.visible = true
		update_points_label()

func update_points_label() -> void:
	points_label.text = "%d Points" % int(Global.points)
