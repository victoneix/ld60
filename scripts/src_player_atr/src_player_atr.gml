function src_player_atr(){
	var _right	= keyboard_check(ord("D"));
	var _left	= keyboard_check(ord("A"));
	var _jump	= keyboard_check(vk_space);
	var _ground	= place_meeting(x,y+1,obj_collision);
	switch(state){
		case "idle":
			hspd = (_right - _left)*move_spd_max;
			if(_jump && _ground){
				vspd = jump_height;
			}
		break;
		
		case "step":
			var _up = keyboard_check(ord("W"));
			var _down = keyboard_check(ord("S")) ;
			hspd = (_right - _left)*move_spd_max;
			
			//if(vspd != 0){
			//	image_speed = 1;
			//} else{
			//	image_speed = 0;
			//}
		
			vspd = (_down - _up)*move_spd_max;
			//if(!place_meeting(x,y,obj_steps)){
			//	state = "idle";
			//}
			
		break;
	}
}