extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var points_label: Label = $"../Panel/VBoxContainer/PointsLabel"
@onready var pps_label: Label = $"../Panel/VBoxContainer/PPSLabel"

func _ready() -> void:
	anim.play("default")

func _process(delta: float) -> void:
	Global.points += Global.points_per_second * delta
	points_label.text = "%d Points" % int(Global.points)
	pps_label.text = "%.1f Points/Second" % Global.points_per_second

func _input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			Global.points += Global.points_per_click
			anim.play("pressed")
		else:
			anim.play("default")
