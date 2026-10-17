// Inherit the parent event
event_inherited();

if(keyboard_check_pressed(ord("R"))) room_restart();
var _ground	= place_meeting(x,y+1,obj_collision);

switch(version){
	
	case "atr":
		src_player_atr();
	break;
	
	case "nes":
		scr_player_nes();
	break;
	
	case "gby":
		scr_player_gby();
	break;
	
}
		
if((!_ground && vspd > 0) && state == "idle"){
	var _enemy = instance_place(x,y+1,obj_enemy);
	if(_enemy){
		vspd = 0;
		vspd = jump_height;
		instance_destroy(_enemy.id);
	}
}

if(instance_place(x+hspd,y,obj_enemy)){
	room_restart();
}

if(instance_place(x+hspd,y,obj_spike)){
	room_restart();
}
