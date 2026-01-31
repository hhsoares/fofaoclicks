extends Node2D

@onready var points_label: Label = $PointsLabel

func _ready() -> void:
	print(Global.points)
