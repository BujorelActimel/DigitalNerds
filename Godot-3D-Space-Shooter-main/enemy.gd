extends KinematicBody

var spd = rand_range(20,50)

const COOLDOWN = 2
var cooldown = 2

onready var main = get_tree().current_scene
var Bullet = load("res://Bullet.tscn")

func _physics_process(delta):
	move_and_slide(Vector3(0,0,spd))
	if transform.origin.z > 10:
		queue_free()
		
	#cooldown
	if cooldown > 0:
		cooldown -= delta
	else:
		cooldown = COOLDOWN
		var bullet = Bullet.instance()
		main.add_child(bullet)
		bullet.transform = $Gun.global_transform
		bullet.velo = bullet.transform.basis.z * -100
		bullet.playerBullet = false
