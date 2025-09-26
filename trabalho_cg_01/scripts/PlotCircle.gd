extends Node2D
@export var center: Vector2 = Vector2(320, 240)
@export var radius: float = 120.0
@export var color: Color = Color(1, 0, 0)


func _ready() -> void:
	queue_redraw()
	
func _draw() -> void:
# Alternativa 2 (uma linha): draw_circle(center, radius, color)
	draw_rect(Rect2(Vector2.ZERO, get_viewport_rect().size), Color(1, 1, 1))
	draw_circle(center, radius, color)

func _input(event):
	if Input.is_action_just_pressed("zoom_in"):
		radius += 10
		queue_redraw()
		print("zoom_in")
	
	if Input.is_action_just_pressed("zoom_out"):
		radius -= 10
		queue_redraw()
		print("zoom_out")
