extends Node

class_name HealthComponent # allow to be casted and use intellisense
signal died
signal health_changed

@export var max_health: float = 10
var current_health

func _ready():
	current_health = max_health

func damage(value: float):
	current_health = max(current_health - value, 0)
	health_changed.emit()
	Callable(check_death).call_deferred() # call the function on next idle frame
	

func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free()	

func get_health_percent():
	if max_health <= 0:
		return 0
	
	return min(current_health / max_health, 1)
