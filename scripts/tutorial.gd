extends Node2D

onready var player = $Player/Player_Character
onready var camera = $Player/Player_Character/Camera2D
var has_moved = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var transition_area = $ToLevel1

# Called when the node enters the scene tree for the first time.
func _ready():
	player.hook.shoot(Vector2(0,-1))
	Fade.level_enter()
	player.this_scene = "res://scenes/tutorial.tscn"
	transition_area.connect("body_entered",self,"_on_body_entered")
	camera.limit_right = 640
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_body_entered(_body:Node):
	Game.change_scene("res://scenes/level1.tscn",Vector2(95,34))

func _input(event):
	if event is InputEventKey and not(has_moved):
		has_moved = true
		player.hook.release()
		player.state = player.State.NORMAL