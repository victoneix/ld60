// Inherit the parent event
event_inherited();

if(keyboard_check_pressed(ord("R"))) room_restart();
var _stop		= keyboard_check_pressed(vk_space);
var _stop_down	= keyboard_check(vk_space);
var _ground		= place_meeting(x,y+1,obj_collision);

switch(state){
	case "idle":
		hspd = move_spd*move_dir;
		if(place_meeting(x+sign(hspd),y,obj_collision)){
			move_dir *= -1; 
		}
		if(_stop && _ground) state = "stop";
		
		if(!_ground && vspd > 0){
			var _enemy = instance_place(x,y+1,obj_enemy);
			if(_enemy){
				vspd = 0;
				vspd = -3;
				instance_destroy(_enemy.id);
			}
		}
	
	break;
	
	case "stop":
		hspd = 0;
		vspd = 0;
		if(_stop_down){
			stop--;
		} else{
			state = "idle";
			stop = stop_max;
		}
		if(stop < 1){
			stop = stop_max;
			state = "idle";
		}
	break;
}

if(instance_place(x+hspd,y,obj_enemy)){
	room_restart();
}

if(instance_place(x+hspd,y,obj_spike)){
	room_restart();
}


show_debug_message(state);