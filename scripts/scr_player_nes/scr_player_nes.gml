function scr_player_nes(){
	var _right	= keyboard_check(ord("D"));
	var _left	= keyboard_check(ord("A"));
	var _jump	= keyboard_check(vk_space);
	var _ground	= place_meeting(x,y+1,obj_collision);
	var _move	= (_right - _left) != 0;
	switch(state){
		case "idle":
			if(_move){
				move_dir = point_direction(0,0,_right - _left,0);
				move_spd = approach(move_spd,move_spd_max,acc);
			} else{
				move_spd = approach(move_spd,0,dcc);
			}
	
			hspd = lengthdir_x(move_spd,move_dir);
		
		
			if(_jump && _ground){
				vspd = jump_height;
			}
		break;
		
		case "step":
			var _up = keyboard_check(ord("W"))
			var _down = keyboard_check(ord("S"))
			if(_move){
				move_dir = point_direction(0,0,_right - _left,0);
				move_spd = approach(move_spd,move_spd_max,acc);
			} else{
				move_spd = approach(move_spd,0,dcc);
			}
			
			//if(vspd != 0){
			//	image_speed = 1;
			//} else{
			//	image_speed = 0;
			//}
			
			hspd = lengthdir_x(move_spd,move_dir);
			vspd = (_down - _up)*move_spd_max;
			//if(!place_meeting(x,y,obj_steps)){
			//	state = "idle";
			//}
			
		break;
	}
}