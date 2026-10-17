spd = 1;
hspd = 0;
vspd = 0;
state = "up";

switch(state){
	case "right":
		hspd += spd;
	break;
	
	case "left":
		hspd -= spd;
	break;
	
	case "up":
		vspd -= spd;
	break;
	
	case "down":
		vspd += spd;
	break;
}