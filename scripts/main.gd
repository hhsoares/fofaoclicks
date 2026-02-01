extends Node2D

@onready var points_label: Label = $Panel/VBoxContainer/PointsLabel
@onready var truck_label: Label = $Panel/VBoxContainer/TruckContainer/TruckLabel
@onready var fofao_label: Label = $Panel/VBoxContainer/FofaoContainer/FofaoLabel
@onready var mickey_label: Label = $Panel/VBoxContainer/MickeyContainer/MickeyLabel
@onready var ca_label: Label = $Panel/VBoxContainer/CAContainer/CALabel
@onready var ha_label: Label = $Panel/VBoxContainer/HAContainer/HALabel

@onready var fofao: Node2D = $Fofao
@onready var mickey: Node2D = $Mickey
@onready var ca: Node2D = $CapitaoAmerica
@onready var ha: Node2D= $HomemAranha

const FOFAO_UPGRADE_COST := 10
const TRUCK_UPGRADE_COST := 20
const MICKEY_UPGRADE_COST := 30
const CA_UPGRADE_COST := 40
const HA_UPGRADE_COST := 50

var truck_level = 1
var fofao_level = 0
var mickey_level = 0
var ca_level = 0
var ha_level = 0

func _ready() -> void:
	update_points_label()
	fofao.visible = false
	mickey.visible = false
	ca.visible = false
	ha.visible = false

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

func _on_mickey_button_pressed() -> void:
	if Global.points >= MICKEY_UPGRADE_COST:
		Global.points -= MICKEY_UPGRADE_COST
		Global.points_per_second += 1.0
		Global.points_per_click += 1.0
		mickey.visible = true
		mickey.get_node("AnimatedSprite2D").play("default")
		mickey_level += 1
		mickey_label.text = "Mickey level %d" % mickey_level
		update_points_label()

func _on_ca_button_pressed() -> void:
	if Global.points >= CA_UPGRADE_COST:
		Global.points -= CA_UPGRADE_COST
		Global.points_per_second += 1.0
		Global.points_per_click += 1.0
		ca.visible = true
		ca.get_node("AnimatedSprite2D").play("default")
		ca_level += 1
		ca_label.text = "Captain America level %d" % ca_level
		update_points_label()

func _on_ha_button_pressed() -> void:
	if Global.points >= HA_UPGRADE_COST:
		Global.points -= HA_UPGRADE_COST
		Global.points_per_second += 1.0
		Global.points_per_click += 1.0
		ha.visible = true
		ha.get_node("AnimatedSprite2D").play("default")
		ha_level += 1
		ha_label.text = "Spiderman level %d" % ha_level
		update_points_label()
