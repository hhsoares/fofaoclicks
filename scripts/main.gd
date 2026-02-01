extends Node2D

@onready var points_label: Label = $PointsLabel
@onready var truck_label: Label = $Panel/TruckLabel
@onready var fofao_label: Label = $Panel/FofaoLabel

@onready var fofao: Node2D = $Fofao

const FOFAO_UPGRADE_COST := 10
const TRUCK_UPGRADE_COST := 20

var truck_level = 1
var fofao_level = 0

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
		fofao_level += 1
		fofao_label.text = "Fofão level %d" % fofao_level
		update_points_label()

func _on_truck_button_pressed() -> void:
	if Global.points >= TRUCK_UPGRADE_COST:
		Global.points -= TRUCK_UPGRADE_COST
		Global.points_per_second += 1.0
		Global.points_per_click += 1.0
		truck_level += 1
		truck_label.text = "Truck level %d" % truck_level
		update_points_label()
