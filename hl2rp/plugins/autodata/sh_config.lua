-- %name% willl become the characters name. 
-- %digits% will become the either the characters citizen id (citizen) or unit id (combine).
nut.config.autoData = {
	[FACTION_CP] = [[
	----------------------
	Unit's Name: %name%
	----------------------
	Digits: %digits%
	----------------------
	]],
	[FACTION_CITIZEN] = [[
	----------------------
	Citizens' Name: %name%
	----------------------
	Citizen ID: %digits%
	----------------------
	Verdict Points: 0
	----------------------
	Loyalty Points: 0
	----------------------
	]],
	[FACTION_OW] = [[
	----------------------
	UNIT: %name%
	----------------------
	UNIT DIGIT: %digits%
	----------------------
	MISSION SUCESS: 0
	----------------------
	MISSION FAILURE: 0
	----------------------
	]]
}