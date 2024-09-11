extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var anim = $AnimationPlayer
	anim.play("fade in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var anim = $AnimationPlayer
	anim.play("PressPlayButton")
	await get_tree().create_timer(0.3).timeout
	anim.play_backwards("fade in")
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file("res://game.tscn")
	


