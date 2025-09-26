extends Node3D


@onready var cubo: Node3D = $ModeloPoligono2Cube001
var rot_x: float = 0.0
var rot_y: float = 0.0
@export var step_deg_per_sec: float = 90.0 # graus por segundo


func _process(delta: float) -> void:
	var step := deg_to_rad(step_deg_per_sec) * delta
	if Input.is_action_pressed("direita"):
		rot_y += step
	if Input.is_action_pressed("esquerda"):
		rot_y -= step
	if Input.is_action_pressed("cima"):
		rot_x += step
	if Input.is_action_pressed("baixo"):
		rot_x -= step
	cubo.rotation = Vector3(rot_x, rot_y, 0.0)	
	
	
func _ready():
	var mesh = cubo.mesh
	for i in range(mesh.get_surface_count()):
		var mat = StandardMaterial3D.new()
		mat.albedo_color = Color(randf(), randf(), randf()) # cores aleatórias
		cubo.set_surface_override_material(i, mat)
