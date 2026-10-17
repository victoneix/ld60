function scr_player_gby(){
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
	}
}