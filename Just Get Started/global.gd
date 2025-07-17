extends Node

var level = 1
var menuStart = false
var canCreep = false
var volume = 8


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func save_game():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
		# Call the node's save function.
	var node_data = {
		"level":level,
		"menuStart":menuStart,
		"volume":volume,
		"canCreep":canCreep
	}
	var json_string = JSON.stringify(node_data)
	save_file.store_line(json_string)
	pass


func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	var json_string = save_file.get_line()
	var json = JSON.new()
	var parse_result = json.parse(json_string)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return
	var node_data = json.data
	level = node_data["level"]
	menuStart = node_data["menuStart"]
	volume = node_data["volume"]
	print(level, menuStart, volume)
