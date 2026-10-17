// Inherit the parent event
event_inherited();

switch(state){
	case "idle":
		hspd = move_spd*move_dir;
		if(place_meeting(x+hspd,y,obj_collision)){
			move_dir *= -1; 
		}
		if(!position_meeting(x+(8*move_dir),y,obj_collision)){
			move_dir *= -1; 
		}
	break;
}