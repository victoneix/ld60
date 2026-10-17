function scr_player_nes(){
	var _right	= keyboard_check(ord("D"));
	var _left	= keyboard_check(ord("A"));
	var _up		= keyboard_check(ord("W"));
	var _down	= keyboard_check(ord("S"));
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
		
		
			if(_ground){
				coyote_time = coyote_time_max;
			} else{
				coyote_time--;
			}
	
			if(coyote_time > 0 && _jump){
				vspd = 0;
				coyote_time = 0;
				vspd = jump_height;
			}
			
			if(instance_place(x,y,obj_step) && _up){
				state = "scaling";
			}
		break;
		
		case "scaling":
			if(_move){
				move_dir = point_direction(0,0,_right - _left,0);
				move_spd = approach(move_spd,move_spd_max,acc);
			} else{
				move_spd = approach(move_spd,0,dcc);
			}
		
			hspd = lengthdir_x(move_spd,move_dir);
			
			vspd = (_down - _up)*move_spd_max;
			if(_jump){ 
				state = "idle";
				vspd = jump_height;
			}
			if(!instance_place(x,y,obj_step)){ 
				state = "idle";
			}
		break;
	}
}