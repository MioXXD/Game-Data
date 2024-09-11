extends Line2D

var isDragging = false
var touch_pos = Vector2()
var all_points = 0
var Collision = false
var isTryangle = false
var isCube = false
var isHex = false
var tryangle: Area2D = null
var tryangle2: Area2D = null
var tryangle3: Area2D = null
var cube: Area2D = null
var cube2: Area2D = null
var cube3: Area2D = null
var Hex: Area2D = null
var Hex2: Area2D = null
var Hex3: Area2D = null
var MovedPoints = 0
var LineMoveStop = false
var playerIStouchingDisplay = false


func _ready():
	all_points = get_point_count()
	tryangle2 = get_parent().get_node("Area2D2")
	tryangle = get_parent().get_node("Area2D")
	tryangle3 = get_parent().get_node("Area2D3")
	cube = get_parent().get_node("CubeArea")
	cube2 = get_parent().get_node("CubeArea2")
	cube3 = get_parent().get_node("CubeArea3")
	Hex = get_parent().get_node("HexArea")
	Hex2 = get_parent().get_node("HexArea2")
	Hex3 = get_parent().get_node("HexArea3")
	


func _unhandled_input(event):
	if event is InputEventScreenTouch and event.pressed and LineMoveStop==false:
		playerIStouchingDisplay = true
		isDragging = true  # Aktiviert das Ziehen, wenn der Bildschirm berührt wird
		touch_pos = convert_to_local(event.position)
	elif event is InputEventScreenDrag and isDragging:
		touch_pos = convert_to_local(event.position)
		new_point()
		playerIStouchingDisplay = true
		if LineMoveStop:
			pass
		else:
			await get_tree().create_timer(0.5).timeout
			remove_point(0)
		
func _process(delta):
	move_swipe_chain(delta)
	

func move_swipe_chain(delta):
	if get_tree().current_scene.name == ("Game"):
		if tryangle.istInDerWischkette == true or tryangle2.istInDerWischkette == true or tryangle3.istInDerWischkette == true or cube.istInDerWischkette == true or cube2.istInDerWischkette == true or cube3.istInDerWischkette == true or Hex.istInDerWischkette == true or Hex2.istInDerWischkette == true or Hex3.istInDerWischkette == true:
			LineMoveStop = true
			for i in range(get_point_count()):
				var point_position = get_point_position(i)
				point_position.y += GlobalSettings.GlobalSpeed() * delta 
				set_point_position(i, point_position)
	else:
		if tryangle.istInDerWischkette == true or tryangle2.istInDerWischkette == true or tryangle3.istInDerWischkette == true or cube.istInDerWischkette == true or cube2.istInDerWischkette == true or cube3.istInDerWischkette == true or Hex.istInDerWischkette == true or Hex2.istInDerWischkette == true or Hex3.istInDerWischkette == true:
			LineMoveStop = true


func new_point():
	add_point(touch_pos)
	all_points += 1


		
	#if isDragging and all_points > 0 and not Collision:
		# Aktualisiert die Position des letzten Punktes, wenn gezogen wird
		#set_point_position(all_points - 1, touch_pos)
		

func convert_to_local(global_position: Vector2) -> Vector2:
	return to_local(global_position)

# Funktion, die aufgerufen wird, wenn eine andere Area2D in die aktuelle Area2D eintritt
	

func _input(event):
	if event is InputEventScreenTouch and not event.pressed:
		default_color = Color(1, 1, 1, 1)
		isDragging = false  # Stoppt das Ziehen, wenn der Bildschirm nicht mehr berü
		clear_points()
		clear_Wischkette()
		all_points = 0
		LineMoveStop = false
		Collision = false
		isTryangle = false
		isCube = false
		isHex = false
		tryangle.istInDerWischkette = false
		tryangle.ControlledPoint = 0
		tryangle2.ControlledPoint = 0
		tryangle2.istInDerWischkette = false
		tryangle3.ControlledPoint = 0
		tryangle3.istInDerWischkette = false
		cube.istInDerWischkette = false
		cube.ControlledPoint = 0
		cube2.istInDerWischkette = false
		cube2.ControlledPoint = 0
		cube3.istInDerWischkette = false
		cube3.ControlledPoint = 0
		Hex.istInDerWischkette = false
		Hex.ControlledPoint = 0
		Hex2.istInDerWischkette = false
		Hex2.ControlledPoint = 0
		Hex3.istInDerWischkette = false
		Hex3.ControlledPoint = 0
		playerIStouchingDisplay = false
			
func clear_Wischkette():
	tryangle.istInDerWischkette = false
	tryangle2.istInDerWischkette = false
	tryangle3.istInDerWischkette = false
	cube.istInDerWischkette = false
	cube2.istInDerWischkette = false
	cube3.istInDerWischkette = false
	Hex.istInDerWischkette = false
	Hex2.istInDerWischkette = false
	Hex3.istInDerWischkette = false
			
func _on_area_2d_area_entered(area):
	Collision = true



func _on_area_2d_area_exited(area):
	Collision = false
	


func _on_cube_area_area_entered(area):
	Collision = true


func _on_cube_area_area_exited(area):
	Collision = false


func _on_hex_area_area_entered(area):
	Collision = true

func _on_hex_area_area_exited(area):
	Collision = false
