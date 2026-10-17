if(keyboard_check_pressed(ord("R"))) room_restart();
var _stop	= keyboard_check_pressed(vk_space);
var _ground = place_meeting(x,y+1,obj_collision);
switch(state){
	case "idle":
		vspd += grav;
		vspd = clamp(vspd,vspd_min,vspd_max);
		hspd = move_spd * move_dir;
		if(place_meeting(x+sign(hspd),y,obj_collision)){
			move_dir *= -1; 
		}
		stop_time = stop_time_max;
		if(_stop && _ground) state = "stop";
	break;
	
	case "stop":
		hspd = 0;
		vspd = 0;
		stop_time--;
		if(stop_time < 1){
			state = "idle";
		}
	break;
}

show_debug_message(state);