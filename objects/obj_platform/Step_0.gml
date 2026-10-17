if(place_meeting(x,y-1,obj_player)) image_speed = 1;
if(view_pos_exit(xstart,ystart,view_camera[0]) && x != xstart){
	x = xstart;
	y = ystart;
}