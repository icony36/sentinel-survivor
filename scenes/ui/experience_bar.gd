extends CanvasLayer

@export var experience_manager: Node
@onready var progress_bar = $MarginContainer/ProgressBar

func _ready():
	progress_bar.value = 0
	experience_manager.experience_updated.connect(on_experience_updated)

func on_experience_updated(current_experience: float, max_experience: float):
	var percentage = current_experience / max(max_experience, 1)
	progress_bar.value = percentage
