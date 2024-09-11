extends Marker2D

var tryangle: Area2D = null
var tryangle2: Area2D = null
var tryangle3: Area2D = null
var cube: Area2D = null
var cube2: Area2D = null
var cube3: Area2D = null
var Hex: Area2D = null
var Hex2: Area2D = null
var Hex3: Area2D = null
var spawn = true
var Wave1Random = randi() % 2
var WaveRandom = randi() % 3
var Wartezeit = 2.5

# Called when the node enters the scene tree for the first time.
func _ready():
	tryangle2 = get_parent().get_node("Area2D2")
	tryangle = get_parent().get_node("Area2D")
	tryangle3 = get_parent().get_node("Area2D3")
	cube = get_parent().get_node("CubeArea")
	cube2 = get_parent().get_node("CubeArea2")
	cube3 = get_parent().get_node("CubeArea3")
	Hex = get_parent().get_node("HexArea")
	Hex2 = get_parent().get_node("HexArea2")
	Hex3 = get_parent().get_node("HexArea3")
	Wave1()
		
func Wave1():
	if WaveRandom == 0:
		SpawnTryangle()
	elif WaveRandom == 1:
		SpawnCube()
	elif WaveRandom == 2:
		SpawnHex()
	await get_tree().create_timer(Wartezeit).timeout
	if WaveRandom == 0 and Wave1Random == 0:
		SpawnCube()
	elif WaveRandom == 0 and Wave1Random == 1:
		SpawnHex()
	elif WaveRandom == 1 and Wave1Random == 0:
		SpawnTryangle()
	elif WaveRandom == 1 and Wave1Random == 1:
		SpawnHex()
	elif WaveRandom == 2 and Wave1Random == 0:
		SpawnTryangle()
	elif WaveRandom == 2 and Wave1Random == 1:
		SpawnCube()
	await get_tree().create_timer(Wartezeit).timeout
	if WaveRandom == 0:
		SpawnTryangle()
	elif WaveRandom == 1:
		SpawnCube()
	elif WaveRandom == 2:
		SpawnHex()
	await get_tree().create_timer(Wartezeit).timeout
	Wave2()
	
	
func Wave2():
	if WaveRandom == 0 and Wave1Random == 0:
		SpawnCube()
	elif WaveRandom == 0 and Wave1Random == 1:
		SpawnHex()
	elif WaveRandom == 1 and Wave1Random == 0:
		SpawnTryangle()
	elif WaveRandom == 1 and Wave1Random == 1:
		SpawnHex()
	elif WaveRandom == 2 and Wave1Random == 0:
		SpawnTryangle()
	elif WaveRandom == 2 and Wave1Random == 1:
		SpawnCube()
	await get_tree().create_timer(Wartezeit).timeout
	if WaveRandom == 0:
		SpawnTryangle()
	elif WaveRandom == 1:
		SpawnCube()
	elif WaveRandom == 2:
		SpawnHex()
	await get_tree().create_timer(Wartezeit).timeout
	if WaveRandom == 0 and Wave1Random == 0:
		SpawnCube()
	elif WaveRandom == 0 and Wave1Random == 1:
		SpawnHex()
	elif WaveRandom == 1 and Wave1Random == 0:
		SpawnTryangle()
	elif WaveRandom == 1 and Wave1Random == 1:
		SpawnHex()
	elif WaveRandom == 2 and Wave1Random == 0:
		SpawnTryangle()
	elif WaveRandom == 2 and Wave1Random == 1:
		SpawnCube()
	await get_tree().create_timer(Wartezeit).timeout
	await get_tree().create_timer(1).timeout
	Wave1Random = randi() % 2
	WaveRandom = randi() % 3
	Wave1()
	
		
		
func SpawnTryangle():
	if tryangle.position.y == 3000:
		tryangle.position.y = position.y
		tryangle.position.x = randf_range(100,900)
		tryangle.IsMoving = true
	elif tryangle2.position.y == 3000:
		tryangle2.position.y = position.y
		tryangle2.position.x = randf_range(100,900)
		tryangle2.IsMoving = true
	elif tryangle3.position.y == 3000:
		tryangle3.position.y = position.y
		tryangle3.position.x = randf_range(100,900)
		tryangle3.IsMoving = true
		
func SpawnCube():
	if cube.position.y == 3000:
		cube.position.y = position.y
		cube.position.x = randf_range(100,900)
		cube.IsMoving = true
	elif cube2.position.y == 3000:
		cube2.position.y = position.y
		cube2.position.x = randf_range(100,900)
		cube2.IsMoving = true
	elif cube3.position.y == 3000:
		cube3.position.y = position.y
		cube3.position.x = randf_range(100,900)
		cube3.IsMoving = true
		
func SpawnHex():
	if Hex.position.y == 3000:
		Hex.position.y = position.y
		Hex.position.x = randf_range(100,900)
		Hex.IsMoving = true
	elif Hex2.position.y == 3000:
		Hex2.position.y = position.y
		Hex2.position.x = randf_range(100,900)
		Hex2.IsMoving = true
	elif Hex3.position.y == 3000:
		Hex3.position.y = position.y
		Hex3.position.x = randf_range(100,900)
		Hex3.IsMoving = true
