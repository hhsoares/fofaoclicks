extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var points_label: Label = $"../PointsLabel"
@onready var pps_label: Label = $"../PPSLabel"

func _ready() -> void:
	anim.play()

func _process(delta: float) -> void:
	Global.points += Global.points_per_second * delta
	points_label.text = "%d Points" % int(Global.points)
	pps_label.text = str(Global.points_per_second) + " Points/Second"

func _input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:
		Global.points += 1
		print(Global.points)
