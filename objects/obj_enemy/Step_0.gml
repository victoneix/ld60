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
		
		if(view_pos_exit(xstart,ystart,view_camera[0])) state = "stop";
	break;
	
	case "stop":
		hspd = 0;
		vspd = 0;
		move_dir = 1;
		x = xstart;
		y = ystart;
		if(!view_pos_exit(xstart,ystart,view_camera[0])) state = "idle";
	break;
}