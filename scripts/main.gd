extends Node2D

@onready var points_label: Label = $Panel/VBoxContainer/PointsLabel
@onready var truck_label: Label = $Panel/VBoxContainer/TruckContainer/TruckLabel
@onready var fofao_label: Label = $Panel/VBoxContainer/FofaoContainer/FofaoLabel
@onready var mickey_label: Label = $Panel/VBoxContainer/MickeyContainer/MickeyLabel
@onready var ca_label: Label = $Panel/VBoxContainer/CAContainer/CALabel
@onready var ha_label: Label = $Panel/VBoxContainer/HAContainer/HALabel

@onready var truck_cost: Label = $Panel/VBoxContainer/TruckContainer/HBoxContainer/TruckCost
@onready var fofao_cost: Label = $Panel/VBoxContainer/FofaoContainer/HBoxContainer/FofaoCost
@onready var mickey_cost: Label = $Panel/VBoxContainer/MickeyContainer/HBoxContainer/MickeyCost
@onready var ca_cost: Label = $Panel/VBoxContainer/CAContainer/HBoxContainer/CACost
@onready var ha_cost: Label = $Panel/VBoxContainer/HAContainer/HBoxContainer/HACost

@onready var fofao_button: Button = $Panel/VBoxContainer/FofaoContainer/HBoxContainer/FofaoButton
@onready var mickey_button: Button = $Panel/VBoxContainer/MickeyContainer/HBoxContainer/MickeyButton
@onready var ca_button: Button = $Panel/VBoxContainer/CAContainer/HBoxContainer/CAButton
@onready var ha_button: Button = $Panel/VBoxContainer/HAContainer/HBoxContainer/HAButton

@onready var fofao: Node2D = $Fofao
@onready var mickey: Node2D = $Mickey
@onready var ca: Node2D = $CapitaoAmerica
@onready var ha: Node2D = $HomemAranha

# Base costs (level 0 -> 1)
const FOFAO_BASE_COST := 10
const TRUCK_BASE_COST := 20
const MICKEY_BASE_COST := 30
const CA_BASE_COST := 40
const HA_BASE_COST := 50

# Cost growth per purchase: cost = ceil(base * (multiplier ^ level))
const COST_MULTIPLIER := 1.25

var truck_level := 1
var fofao_level := 0
var mickey_level := 0
var ca_level := 0
var ha_level := 0

func _ready() -> void:
	fofao.visible = false
	mickey.visible = false
	ca.visible = false
	ha.visible = false

	truck_label.text = "Carreta Furacão Level %d" % truck_level

	update_points_label()
	update_cost_labels()

func update_points_label() -> void:
	points_label.text = "%d Points" % int(Global.points)

func get_upgrade_cost(base_cost: int, level: int) -> int:
	# level is current level; buying next one increases cost based on current level
	return int(ceil(base_cost * pow(COST_MULTIPLIER, level)))

func update_cost_labels() -> void:
	truck_cost.text = "%d" % get_upgrade_cost(TRUCK_BASE_COST, truck_level)
	fofao_cost.text = "%d" % get_upgrade_cost(FOFAO_BASE_COST, fofao_level)
	mickey_cost.text = "%d" % get_upgrade_cost(MICKEY_BASE_COST, mickey_level)
	ca_cost.text = "%d" % get_upgrade_cost(CA_BASE_COST, ca_level)
	ha_cost.text = "%d" % get_upgrade_cost(HA_BASE_COST, ha_level)

func _on_fofao_button_pressed() -> void:
	var was_first_buy := (fofao_level == 0)

	var cost := get_upgrade_cost(FOFAO_BASE_COST, fofao_level)
	if Global.points < cost:
		return

	Global.points -= cost
	Global.points_per_second += 1.0
	Global.points_per_click += 1.0

	fofao.visible = true
	fofao.get_node("AnimatedSprite2D").play("fofao")

	fofao_level += 1
	fofao_label.text = "Fofão Level %d" % fofao_level

	if was_first_buy:
		fofao_button.text = "UPGRADE"

	update_points_label()
	update_cost_labels()

func _on_truck_button_pressed() -> void:
	var cost := get_upgrade_cost(TRUCK_BASE_COST, truck_level)
	if Global.points < cost:
		return

	Global.points -= cost
	Global.points_per_second += 1.0
	Global.points_per_click += 1.0

	truck_level += 1
	truck_label.text = "Carreta Furacão Level %d" % truck_level

	update_points_label()
	update_cost_labels()

func _on_mickey_button_pressed() -> void:
	var was_first_buy := (mickey_level == 0)

	var cost := get_upgrade_cost(MICKEY_BASE_COST, mickey_level)
	if Global.points < cost:
		return

	Global.points -= cost
	Global.points_per_second += 1.0
	Global.points_per_click += 1.0

	mickey.visible = true
	mickey.get_node("AnimatedSprite2D").play("mickey")

	mickey_level += 1
	mickey_label.text = "Mickey Level %d" % mickey_level

	if was_first_buy:
		mickey_button.text = "UPGRADE"

	update_points_label()
	update_cost_labels()


func _on_ca_button_pressed() -> void:
	var was_first_buy := (ca_level == 0)

	var cost := get_upgrade_cost(CA_BASE_COST, ca_level)
	if Global.points < cost:
		return

	Global.points -= cost
	Global.points_per_second += 1.0
	Global.points_per_click += 1.0

	ca.visible = true
	ca.get_node("AnimatedSprite2D").play("ca")

	ca_level += 1
	ca_label.text = "Capitão America Level %d" % ca_level

	if was_first_buy:
		ca_button.text = "UPGRADE"

	update_points_label()
	update_cost_labels()


func _on_ha_button_pressed() -> void:
	var was_first_buy := (ha_level == 0)

	var cost := get_upgrade_cost(HA_BASE_COST, ha_level)
	if Global.points < cost:
		return

	Global.points -= cost
	Global.points_per_second += 1.0
	Global.points_per_click += 1.0

	ha.visible = true
	ha.get_node("AnimatedSprite2D").play("miranha")

	ha_level += 1
	ha_label.text = "Homem Aranha Level %d" % ha_level

	if was_first_buy:
		ha_button.text = "UPGRADE"

	update_points_label()
	update_cost_labels()
