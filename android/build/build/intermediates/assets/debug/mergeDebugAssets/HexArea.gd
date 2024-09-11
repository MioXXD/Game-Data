extends Area2D

#Referenz zur Line2D, die die Punkte setzen soll
var line_2d: Line2D = null
var istInDerWischkette: bool = false
var tryangle: Area2D = null
var tryangle2: Area2D = null
var tryangle3: Area2D = null
var ControlledPoint: int = 0
var IsMoving = false
var verkleinert = false
var animation: AnimationPlayer = null

func _ready():
	# Hier die Referenz zur Line2D setzen (falls sie nicht im Editor gesetzt wird)
	line_2d = get_parent().get_node("Line2D")
	tryangle = get_parent().get_node("HexArea")
	tryangle2 = get_parent().get_node("HexArea2")
	tryangle3 = get_parent().get_node("HexArea3")
	animation = get_parent().get_node("AnimationPlayer")

"""
	if IsMoving == true: 
		position.y = position.y + 1
		rotation_degrees = rotation_degrees + 0.2
	if istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle.istInDerWischkette == false and tryangle3.istInDerWischkette == false:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == false and tryangle.istInDerWischkette == true and tryangle3.istInDerWischkette == false:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == false and tryangle.istInDerWischkette == false and tryangle3.istInDerWischkette == true:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle.istInDerWischkette == true and tryangle3.istInDerWischkette == false and ControlledPoint == tryangle.ControlledPoint and ControlledPoint > tryangle2.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle2.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle.istInDerWischkette == true and tryangle3.istInDerWischkette == false and ControlledPoint == tryangle2.ControlledPoint and ControlledPoint > tryangle.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle.istInDerWischkette == false and tryangle3.istInDerWischkette == true and ControlledPoint == tryangle2.ControlledPoint and ControlledPoint > tryangle3.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle3.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle.istInDerWischkette == false and tryangle3.istInDerWischkette == true and ControlledPoint == tryangle3.ControlledPoint and ControlledPoint > tryangle2.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle2.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == false and tryangle.istInDerWischkette == true and tryangle3.istInDerWischkette == true and ControlledPoint == tryangle3.ControlledPoint and ControlledPoint > tryangle.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == false and tryangle.istInDerWischkette == true and tryangle3.istInDerWischkette == true and ControlledPoint == tryangle.ControlledPoint and ControlledPoint > tryangle3.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle3.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle.istInDerWischkette == true and tryangle3.istInDerWischkette == true and ControlledPoint == tryangle3.ControlledPoint and ControlledPoint > tryangle2.ControlledPoint and tryangle2.ControlledPoint > tryangle.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle2.position)
			line_2d.set_point_position(line_2d.all_points-4,tryangle.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle.istInDerWischkette == true and tryangle3.istInDerWischkette == true and ControlledPoint == tryangle2.ControlledPoint and ControlledPoint > tryangle3.ControlledPoint and tryangle3.ControlledPoint > tryangle.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle3.position)
			line_2d.set_point_position(line_2d.all_points-4,tryangle.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle.istInDerWischkette == true and tryangle3.istInDerWischkette == true and ControlledPoint == tryangle3.ControlledPoint and ControlledPoint > tryangle.ControlledPoint and tryangle.ControlledPoint > tryangle2.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle.position)
			line_2d.set_point_position(line_2d.all_points-4,tryangle2.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle.istInDerWischkette == true and tryangle3.istInDerWischkette == true and ControlledPoint == tryangle.ControlledPoint and ControlledPoint > tryangle3.ControlledPoint and tryangle3.ControlledPoint > tryangle2.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle.position)
			line_2d.set_point_position(line_2d.all_points-4,tryangle2.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle.istInDerWischkette == true and tryangle3.istInDerWischkette == true and ControlledPoint == tryangle.ControlledPoint and ControlledPoint > tryangle2.ControlledPoint and tryangle2.ControlledPoint > tryangle3.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle2.position)
			line_2d.set_point_position(line_2d.all_points-4,tryangle3.position)
	if istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle.istInDerWischkette == true and tryangle3.istInDerWischkette == true and ControlledPoint == tryangle2.ControlledPoint and ControlledPoint > tryangle.ControlledPoint and tryangle.ControlledPoint > tryangle3.ControlledPoint:
			line_2d.set_point_position(line_2d.all_points-2,self.position)
			line_2d.set_point_position(line_2d.all_points-3,tryangle2.position)
			line_2d.set_point_position(line_2d.all_points-4,tryangle3.position)"""
func _process(delta):
	if istInDerWischkette:
		scale.x = 0.32
		scale.y = 0.311
	else:
		scale.x = 0.27
		scale.y = 0.262
	if IsMoving: 
		position.y = position.y + 1
		rotation_degrees = rotation_degrees + 0.2
	if tryangle.istInDerWischkette == true and tryangle2.istInDerWischkette == true and tryangle3.istInDerWischkette == true:
			line_2d.default_color = Color(1, 1, 1, 1)
			line_2d.clear_Wischkette()
			line_2d.clear_points()
			line_2d.isDragging = false  # Stoppt das Ziehen, wenn der Bildschirm nicht mehr berü
			line_2d.all_points = 0
			line_2d.LineMoveStop = false
			line_2d.Collision = false
			line_2d.isTryangle = false
			line_2d.isCube = false
			line_2d.isHex = false
			line_2d.clear_Wischkette()
			verkleinert = true
			animation.play("Hex")
			await get_tree().create_timer(0.5).timeout
			tryangle.IsMoving = false
			tryangle2.IsMoving = false
			tryangle3.IsMoving = false
			tryangle.position.y = 3000
			tryangle2.position.y = 3000
			tryangle3.position.y = 3000
			verkleinert = false
			tryangle.ControlledPoint = 0
			tryangle2.ControlledPoint = 0
			tryangle3.ControlledPoint = 0 
	
	





func _on_area_entered(area):
	if line_2d:
		if line_2d.isTryangle == false and line_2d.isCube == false and not position.y == 3000:
			#var shape = $CollisionShape2D.shape
			#var area_center = Vector2()
			#area_center = Vector2(0,0)
			#var global_pos = to_global(area_center)
			#var local_pos = line_2d.to_local(global_pos)
			#line_2d.add_point(local_pos)
			#line_2d.all_points += 1
			istInDerWischkette = true
			line_2d.default_color = Color(0.133, 0, 1, 1)
			line_2d.isTryangle = false
			line_2d.isCube = false
			line_2d.isHex = true
			ControlledPoint = line_2d.all_points
