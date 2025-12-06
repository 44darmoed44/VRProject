extends Node

var room_updater: RoomUpdater

var room_preload = {
	"rm_lab" : {
		"1" : preload("res://Models/RomanovLab/Models/1.glb"),
		"2" : preload("res://Models/RomanovLab/Models/2.glb"),
		"3" : preload("res://Models/RomanovLab/Models/3.glb"),
		"4" : preload("res://Models/RomanovLab/Models/4.glb"),
		"5" : preload("res://Models/RomanovLab/Models/5.glb"),
		"6" : preload("res://Models/RomanovLab/Models/6.glb"),
		"7" : preload("res://Models/RomanovLab/Models/7.glb"),
		"8" : preload("res://Models/RomanovLab/Models/8.glb"),
		"9" : preload("res://Models/RomanovLab/Models/9.glb"),
		"10" : preload("res://Models/RomanovLab/Models/10.glb"),
		"11" : preload("res://Models/RomanovLab/Models/11.glb"),
		"12" : preload("res://Models/RomanovLab/Models/12.glb"),
		"13" : preload("res://Models/RomanovLab/Models/13.glb"),
		"14" : preload("res://Models/RomanovLab/Models/14.glb"),
		"15" : preload("res://Models/RomanovLab/Models/15.glb"),
		"16" : preload("res://Models/RomanovLab/Models/16.glb"),
		"17" : preload("res://Models/RomanovLab/Models/17.glb"),
		"18" : preload("res://Models/RomanovLab/Models/18.glb"),
		"19" : preload("res://Models/RomanovLab/Models/19.glb"),
	},
	"kitchen_lab" : {
		"1" : preload("res://Models/KitchenLab/Models/1.glb"),
		"2" : preload("res://Models/KitchenLab/Models/2.glb"),
		"3" : preload("res://Models/KitchenLab/Models/3.glb"),
		"4" : preload("res://Models/KitchenLab/Models/4.glb"),
		"5" : preload("res://Models/KitchenLab/Models/5.glb"),
		"6" : preload("res://Models/KitchenLab/Models/6.glb"),
		"7" : preload("res://Models/KitchenLab/Models/7.glb"),
		"8" : preload("res://Models/KitchenLab/Models/8.glb"),
		"9" : preload("res://Models/KitchenLab/Models/9.glb"),
		"10" : preload("res://Models/KitchenLab/Models/10.glb"),
	}
}

var room_config = {
	"rm_lab" : {
		"1" : {
			"forward" : "pass",
			"back" : "18",
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
			"right" : "5",
			"left" : "2",
			"ratio_y" : -2.5
		},
		"5" : {
			"forward" : "pass",
			"back" : "6",
			"right" : "pass",
			"left" : "3",
			"ratio_y" : 13.8,
			"lab_transf" : {
				"pos" : "forward",
				"next_lab" : "kitchen_lab",
				"next_room" : "8"
			}
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
			"forward" : "pass",
			"back" : "pass",
			"right" : "9",
			"left" : "11",
			"ratio_y" : -100
		},
		"11" : {
			"forward" : "12",
			"back" : "pass",
			"right" : "10",
			"left" : "14",
			"ratio_y" : -94.7
		},
		"12" : {
			"forward" : "13",
			"back" : "11",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -172.9
		},
		"13" : {
			"forward" : "pass",
			"back" : "12",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : 171.6
		},
		"14" : {
			"forward" : "pass",
			"back" : "pass",
			"right" : "11",
			"left" : "15",
			"ratio_y" : -138.7
		},
		"15" : {
			"forward" : "16",
			"back" : "pass",
			"right" : "14",
			"left" : "pass",
			"ratio_y" : 125.7
		},
		"16" : {
			"forward" : "17",
			"back" : "15",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : 75.5
		},
		"17" : {
			"forward" : "18",
			"back" : "16",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : 50
		},
		"18" : {
			"forward" : "1",
			"back" : "17",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : 10.8
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
			"back" : "2",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -84.2
		},
		"2" : {
			"forward" : "1",
			"back" : "3",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -86.7
		},
		"3" : {
			"forward" : "2",
			"back" : "pass",
			"right" : "pass",
			"left" : "4",
			"ratio_y" : -88.2
		},
		"4" : {
			"forward" : "5",
			"back" : "pass",
			"right" : "3",
			"left" : "7",
			"ratio_y" : -92.1
		},
		"5" : {
			"forward" : "6",
			"back" : "4",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -91.1
		},
		"6" : {
			"forward" : "pass",
			"back" : "5",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -89.6
		},
		"7" : {
			"forward" : "9",
			"back" : "8",
			"right" : "4",
			"left" : "pass",
			"ratio_y" : -89.6
		},
		"8" : {
			"forward" : "7",
			"back" : "pass",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -90.0,
			"lab_transf" : {
				"pos" : "left",
				"next_lab" : "rm_lab",
				"next_room" : "5"
			}
		},
		"9" : {
			"forward" : "10",
			"back" : "7",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -87.1
		},
		"10" : {
			"forward" : "pass",
			"back" : "9",
			"right" : "pass",
			"left" : "pass",
			"ratio_y" : -96.3
		},
	}
}
