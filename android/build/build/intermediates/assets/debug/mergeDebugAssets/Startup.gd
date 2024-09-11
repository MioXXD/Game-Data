extends Control
const LoadingMainMenuInBackground = preload("res://MainMenu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var anim = $AnimationPlayer
	anim.play("opening")
	await get_tree().create_timer(2).timeout
	anim.play("Studios")
	await get_tree().create_timer(3.5).timeout
	get_tree().change_scene_to_file("res://MainMenu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


