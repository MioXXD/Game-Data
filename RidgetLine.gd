extends RigidBody2D

var touch_pos = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Setzt die Position des Nodes auf die Touchposition
	position = touch_pos

func _unhandled_input(event):
	if event is InputEventScreenTouch and event.pressed:
		touch_pos = event.position
		
	elif event is InputEventScreenDrag:
		touch_pos = event.position



