extends SceneTree

var flags = {
	"--width": 1920,
	"--height": 1080,
	"--stars": false,
	"--dust": false,
	"--nebulae": false,
	"--planets": false,
	"--tile": false,
	"--darken": false,
	"--transparency": false,
	"--theme": 1,
	"--colorscheme": ""
}

var themes_path = "GUI/HBoxContainer/ColorRect/Settings/ScrollContainer/VBoxContainer/"
var themes = {
	1: themes_path + "Button",
	2: themes_path + "Button4",
	3: themes_path + "Button9",
	4: themes_path + "Button11",
	5: themes_path + "Button10",
	6: themes_path + "Button6",
	7: themes_path + "Button8",
	8: themes_path + "Button5",
	9: themes_path + "Button3",
	10: themes_path + "Button7",
	11: themes_path + "Button2",
	12: themes_path + "Button12",
	13: themes_path + "Button13",
}

func _init() -> void:
	# parse cli arguments
	var args := OS.get_cmdline_args()
	for i in range((args.size() - (args.size() % 2)) / 2):
		var key = args[i*2]
		var val = args[i*2+1]
		if !flags.has(key):
			if key != "-s" && key != "--script":
				print("unknown flag ", key)
			continue
		
		var t := typeof(flags.get(key))
		if t == TYPE_BOOL:
			flags[key] = val == "true"
		elif t == TYPE_INT:
			flags[key] = int(val)
		elif t == TYPE_STRING:
			flags[key] = val
		else:
			print("invalid type for ", key)

	# load main scene
	var main_scene: Node = load("res://GUI/GUI.tscn").instantiate()
	root.add_child(main_scene)
	await main_scene.ready

	# set required wallpaper parameters
	main_scene._on_PixelsWidth_value_changed(flags["--width"])
	main_scene._on_PixelsHeight_value_changed(flags["--height"])
	root.get_node(themes[flags["--theme"]]).emit_signal("pressed")

	# set optional wallpaper parameters
	if !flags["--stars"]:
		main_scene._on_EnableStars_pressed()
	if !flags["--dust"]:
		main_scene._on_EnableDust_pressed()
	if !flags["--nebulae"]:
		main_scene._on_EnableNebulae_pressed()
	if !flags["--planets"]:
		main_scene._on_EnablePlanets_pressed()
	if flags["--tile"]:
		main_scene._on_EnableTile_pressed()
	if flags["--darken"]:
		main_scene._on_EnableReduceBackground_pressed()
	if flags["--transparency"]:
		main_scene._on_EnableTransparency_pressed()
	if flags["--colorscheme"]:
		var colorArr: Array[Color]
		for color in flags["--colorscheme"].split(","):
			colorArr.append(Color(color))

		main_scene.select_colorscheme(PackedColorArray(colorArr))
	
	# press new button to change image size
	main_scene._on_NewButton_pressed()
	# wait for particles to generate
	await main_scene.get_node("SubViewport/BackgroundGenerator/PauseParticles").timeout
	# export
	main_scene._on_ExportButton_pressed()
	await main_scene.get_node("SaveTimer").timeout

	quit()

