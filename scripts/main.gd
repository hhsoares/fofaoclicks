extends Node2D

@onready var points_label: Label = $PointsLabel

@onready var fofao: Node2D = $Fofao

const FOFAO_UPGRADE_COST := 10
const TRUCK_UPGRADE_COST := 20

func _ready() -> void:
	update_points_label()
	fofao.visible = false

func update_points_label() -> void:
	points_label.text = "%d Points" % int(Global.points)

func _on_fofao_button_pressed() -> void:
	if Global.points >= FOFAO_UPGRADE_COST:
		Global.points -= FOFAO_UPGRADE_COST
		Global.points_per_second += 1.0
		Global.points_per_click += 1.0
		fofao.visible = true
		fofao.get_node("AnimatedSprite2D").play("default")
		update_points_label()

func _on_truck_button_pressed() -> void:
	if Global.points >= TRUCK_UPGRADE_COST:
		Global.points -= TRUCK_UPGRADE_COST
		Global.points_per_second += 1.0
		Global.points_per_click += 1.0
		update_points_label()
