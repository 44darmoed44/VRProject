extends Node

var room_preload = {
	"rm_lab" : {
		"1" : preload("res://Source/RomanovLab/Models/1.glb"),
		"2" : preload("res://Source/RomanovLab/Models/2.glb"),
		"3" : preload("res://Source/RomanovLab/Models/3.glb"),
		"4" : preload("res://Source/RomanovLab/Models/4.glb"),
		"5" : preload("res://Source/RomanovLab/Models/5.glb"),
		"6" : preload("res://Source/RomanovLab/Models/6.glb"),
		"7" : preload("res://Source/RomanovLab/Models/7.glb"),
		"8" : preload("res://Source/RomanovLab/Models/8.glb"),
		"9" : preload("res://Source/RomanovLab/Models/9.glb"),
		"10" : preload("res://Source/RomanovLab/Models/10.glb"),
		"11" : preload("res://Source/RomanovLab/Models/11.glb"),
		"12" : preload("res://Source/RomanovLab/Models/12.glb"),
		"13" : preload("res://Source/RomanovLab/Models/13.glb"),
		"14" : preload("res://Source/RomanovLab/Models/14.glb"),
		"15" : preload("res://Source/RomanovLab/Models/15.glb"),
		"16" : preload("res://Source/RomanovLab/Models/16.glb"),
		"17" : preload("res://Source/RomanovLab/Models/17.glb"),
		"18" : preload("res://Source/RomanovLab/Models/18.glb"),
		"19" : preload("res://Source/RomanovLab/Models/19.glb"),
	},
	"kitchen_lab" : {
		"1" : preload("res://Source/KitchenLab/Models/1.glb"),
		"2" : preload("res://Source/KitchenLab/Models/2.glb"),
		"3" : preload("res://Source/KitchenLab/Models/3.glb"),
		"4" : preload("res://Source/KitchenLab/Models/4.glb"),
		"5" : preload("res://Source/KitchenLab/Models/5.glb"),
		"6" : preload("res://Source/KitchenLab/Models/6.glb"),
		"7" : preload("res://Source/KitchenLab/Models/7.glb"),
		"8" : preload("res://Source/KitchenLab/Models/8.glb"),
		"9" : preload("res://Source/KitchenLab/Models/9.glb"),
		"10" : preload("res://Source/KitchenLab/Models/10.glb"),
	}
}

var room_config = {
	"rm_lab" : {
		"1" : {
			"forward" : "pass",
			"back" : "19",
			"right" : "2",
			"left" : "pass",
			"ratio_y" : 13.2
		},
		"2" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "3",
			"left" : "1",
			"ratio_y" : -6
		},
		"3" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "4",
			"left" : "2",
			"ratio_y" : -2.5
		},
		"4" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "5",
			"left" : "3",
			"ratio_y" : -40.5
		},
		"5" : {
			"forward" : "pass",
			"back" : "6",
			"right" : "pass",
			"left" : "4",
			"ratio_y" : 13.8
		},
		"6" : {
			"forward" : "5",
			"back" : "7",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -2.5
		},
		"7" : {
			"forward" : "6",
			"back" : "8",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -12.1
		},
		"8" : {
			"forward" : "7",
			"back" : "9",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -20.0
		},
		"9" : {
			"forward" : "8",
			"back" : "pass",
			"right" : "pass",
			"left" : "10",
			"ratio_y" : -14.8
		},
		"10" : {
			"forward" : "9",
			"back" : "11",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -10
		},
		"11" : {
			"forward" : "10",
			"back" : "14",
			"right" : "pass",
			"left" : "12",
			"ratio_y" : -4.3
		},
		"12" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "11",
			"left" : "13",
			"ratio_y" : -81.0
		},
		"13" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "12",
			"left" : "pass",
			"ratio_y" : -97.8
		},
		"14" : {
			"forward" : "11",
			"back" : "15",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -48.5
		},
		"15" : {
			"forward" : "pass",
			"back" : "16",
			"right" : "pass",
			"left" : "14",
			"ratio_y" : -56.0
		},
		"16" : {
			"forward" : "15",
			"back" : "17",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -106.1
		},
		"17" : {
			"forward" : "16",
			"back" : "18",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -130.9
		},
		"18" : {
			"forward" : "17",
			"back" : "19",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -168.3
		},
		"19" : {
			"forward" : "pass",
			"back" : "1",
			"right" : "pass",
			"left" : "18",
			"ratio_y" : -155.2
		}
	},
	"kitchen_lab" : {
		"1" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "pass",
			"left" : "2",
			"ratio_y" : -137.9
		},
		"2" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "1",
			"left" : "3",
			"ratio_y" : -137.9
		},
		"3" : {
			"forward" : "4",
			"back" : "pass",
			"right" : "2",
			"left" : "pass",
			"ratio_y" : -137.9
		},
		"4" : {
			"forward" : "7",
			"back" : "3",
			"right" : "5",
			"left" : "pass",
			"ratio_y" : 178.3
		},
		"5" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "6",
			"left" : "4",
			"ratio_y" : 178.3
		},
		"6" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "pass",
			"left" : "5",
			"ratio_y" : 178.3
		},
		"7" : {
			"forward" : "pass",
			"back" : "4",
			"right" : "9",
			"left" : "8",
			"ratio_y" : 178.3
		},
		"8" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "7",
			"left" : "pass",
			"ratio_y" : -178.6
		},
		"9" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "10",
			"left" : "7",
			"ratio_y" : 178.3
		},
		"10" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "pass",
			"left" : "9",
			"ratio_y" : 175.7
		},
	}
}
