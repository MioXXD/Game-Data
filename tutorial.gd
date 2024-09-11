extends Node2D

var tryangle: Area2D = null
var tryangle2: Area2D = null
var tryangle3: Area2D = null
var cube: Area2D = null
var cube2: Area2D = null
var cube3: Area2D = null
var Hex: Area2D = null
var Hex2: Area2D = null
var Hex3: Area2D = null
# Called when the node enters the scene tree for the first time.
func _ready():
	var anim = $AnimationPlayer2
	anim.play("Background")
	tryangle2 = $Area2D2
	tryangle = $Area2D
	tryangle3 = $Area2D3
	cube = $CubeArea
	cube2 = $CubeArea2
	cube3 = $CubeArea3
	Hex = $HexArea
	Hex2 = $HexArea2
	Hex3 = $HexArea3
	#SpawnHex()
	SpawnTryangle()
	SpawnTryangle()
	SpawnTryangle()
	#SpawnCube()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func SpawnHex():
	if Hex.position.y == 3000:
		Hex.position.y = get_viewport_rect().size.y/4
		Hex.position.x = get_viewport_rect().size.x/4
		Hex.IsMoving = false
	elif Hex2.position.y == 3000:
		Hex2.position.y = get_viewport_rect().size.y/2
		Hex2.position.x = get_viewport_rect().size.x/2
		Hex2.IsMoving = false
	elif Hex3.position.y == 3000:
		Hex3.position.y = get_viewport_rect().size.y/1.32
		Hex3.position.x = get_viewport_rect().size.x/1.32
		Hex3.IsMoving = false
		
func SpawnTryangle():
	if tryangle.position.y == 3000:
		tryangle.position.y = get_viewport_rect().size.y/4
		tryangle.position.x = get_viewport_rect().size.x/4
		tryangle.IsMoving = false
	elif tryangle2.position.y == 3000:
		tryangle2.position.y = get_viewport_rect().size.y/2
		tryangle2.position.x = get_viewport_rect().size.x/2
		tryangle2.IsMoving = false
	elif tryangle3.position.y == 3000:
		tryangle3.position.y = get_viewport_rect().size.y/1.32
		tryangle3.position.x = get_viewport_rect().size.x/1.32
		tryangle3.IsMoving = false
		
func SpawnCube():
	if cube.position.y == 3000:
		cube.position.y = get_viewport_rect().size.y/4
		cube.position.x = get_viewport_rect().size.x/4
		cube.IsMoving = false
	elif cube2.position.y == 3000:
		cube2.position.y = get_viewport_rect().size.y/2
		cube2.position.x = get_viewport_rect().size.x/2
		cube2.IsMoving = false
	elif cube3.position.y == 3000:
		cube3.position.y = get_viewport_rect().size.y/1.32
		cube3.position.x = get_viewport_rect().size.x/1.32
		cube3.IsMoving = false

