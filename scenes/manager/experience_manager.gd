extends Node

signal experience_updated(current_experience: float, max_experience: float)
signal level_up(new_level: int)

const MAX_EXPERIENCE_GROWTH = 5

var current_experience = 0
var current_level = 1
var max_experience = 5

func _ready():
	GameEvents.experience_vial_collected.connect(on_experience_vial_collected)

func increment_experience(number: float):
	current_experience = min(current_experience + number, max_experience)
	experience_updated.emit(current_experience, max_experience)
	if current_experience >= max_experience:
		var overflow_experience = current_experience - max_experience
		current_experience += 1
		max_experience += MAX_EXPERIENCE_GROWTH
		current_experience = overflow_experience
		experience_updated.emit(current_experience, max_experience)
		level_up.emit(current_level)
		

func on_experience_vial_collected(number: float):
	increment_experience(number)
