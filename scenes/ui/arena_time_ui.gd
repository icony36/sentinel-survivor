extends CanvasLayer

@export var arena_time_manager: Node
@onready var label = %Label

func _process(delta):
	if arena_time_manager == null:
		return
		
	
	var time_elapsed = arena_time_manager.get_time_elapsed()
	label.text = format_seconds_to_string(time_elapsed)

func format_seconds_to_string(value: int):
	var minutes = (value / 60) % 60
	var seconds = value % 60
	return  "%02d:%02d" % [minutes, seconds]
