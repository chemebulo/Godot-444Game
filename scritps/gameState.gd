extends Node

var chapter := 1
var night := 1

var flags := {}
var choices := {}

func reset():
	chapter = 1
	night = 1
	flags.clear()
	choices.clear()
