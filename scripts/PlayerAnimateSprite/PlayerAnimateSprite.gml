// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAnimateSprite(){
	//Update Sprite
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	
	image_index = localFrame + (CARDINAL_DIR * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
	
	//If animation would loop on next game step
	if (localFrame >= _totalFrames){
		animationEnd = true;
		localFrame -= _totalFrames;
	}else {
		animationEnd = false;
	}
}

function MACROS(){
	#macro FRAME_RATE 60
	#macro TILE_SIZE 16
	#macro CARDINAL_DIR round(direction/90)
	#macro ROOM_START rVillage
	
}


function PlayerCollision(){
	var _collision = false;
	
	//Horizontal Tiles
	if(tilemap_get_at_pixel(collisionMap, x + hSpeed, y)){
		x -= x mod TILE_SIZE
		if(sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
		_collision = true;
	}
	
	//Horizontal Move Commit
	x += hSpeed;
	
	//Vertical Tiles
	if(tilemap_get_at_pixel(collisionMap, x, y + vSpeed)){
		y -= y mod TILE_SIZE
		if(sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	}
	
	//Vertical Move Commit
	y += vSpeed;
	
	
	return _collision;
}