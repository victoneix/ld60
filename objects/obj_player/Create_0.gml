// Inherit the parent event
event_inherited();

state = "idle";
version = "nes";

move_spd = 0;
move_spd_max = 2;
acc = .3;
dcc = .3;

coyote_time_max = 10;
coyote_time = 0;

switch(version){
	case "atr":
		move_spd_max = 1;
		hspd = 0;
		vspd = 0;
		grav = 0.2;
		
		vspd_max = 4;
		vspd_min = -4;
		jump_height = -4;
	break;
	
	case "nes":
		move_spd_max = 2;
		hspd = 0;
		vspd = 0;
		grav = 0.4;
		
		vspd_max = 7;
		vspd_min = -7;
		jump_height = -5;
	break;
	
	case "gby":
		move_spd_max = 2;
		hspd = 0;
		vspd = 0;
		grav = 0.5;
		
		vspd_max = 6;
		vspd_min = -6;
		jump_height = -5;
	break;
}

approach = function(val1 = 0, val2 = 0, amount = 0){
	if(val1 < val2){
		val1 += amount
		if(val1 > val2)
			return val2;
	} else{
		val1 -= amount
		if(val1 < val2)
			return val2;
	}
	return val1;
}