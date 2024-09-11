extends Control
const LoadingMainMenuInBackground = preload("res://MainMenu.tscn")
const LoadingTutorialInBackground = preload("res://tutorial.tscn")
var save_path = "user://variable.save"
var tutorialIsPlayed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	var anim = $AnimationPlayer
	anim.play("opening")
	await get_tree().create_timer(2).timeout
	anim.play("Studios")
	await get_tree().create_timer(3.5).timeout
	load_data()
	if tutorialIsPlayed:
		get_tree().change_scene_to_file("res://MainMenu.tscn")
	else:
		print("tutorial is showing now")
		tutorialIsPlayed = true
		save()
		get_tree().change_scene_to_file("res://tutorial.tscn")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(tutorialIsPlayed)
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		tutorialIsPlayed = file.get_var(tutorialIsPlayed)
	else:
		print("creating a save game")
		save()
