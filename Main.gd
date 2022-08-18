extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var startPos = Vector3(-3, 0, 0)
var endPos = Vector3(3, 0, 0)
var duration = 1
var trans = Tween.TRANS_LINEAR
var ease_type = Tween.EASE_IN


# Called when the node enters the scene tree for the first time.
func _ready():
	$Tween.connect("tween_all_completed", self, "go")
	go()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func go():
	startPos *= -1
	endPos *= -1
	$Tween.interpolate_property($CSGBox, "translation", startPos, endPos, duration, trans, ease_type)
	$Tween.start()


func _on_TransTypeButton_item_selected(index:int):
	match index:
		0: trans = Tween.TRANS_LINEAR
		1: trans = Tween.TRANS_SINE
		2: trans = Tween.TRANS_QUINT
		3: trans = Tween.TRANS_QUART
		4: trans = Tween.TRANS_QUAD
		5: trans = Tween.TRANS_EXPO
		6: trans = Tween.TRANS_ELASTIC
		7: trans = Tween.TRANS_CUBIC
		8: trans = Tween.TRANS_CIRC
		9: trans = Tween.TRANS_BOUNCE
		10: trans = Tween.TRANS_BACK


func _on_EaseTypeButton_item_selected(index:int):
	match index:
		0: ease_type = Tween.EASE_IN
		1: ease_type = Tween.EASE_OUT
		2: ease_type = Tween.EASE_IN_OUT
		3: ease_type = Tween.EASE_OUT_IN
