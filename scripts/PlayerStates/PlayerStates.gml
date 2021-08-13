function PlayerStateFree(){
	
//Movement
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

PlayerCollision();

//Update Sprite Index
	var _oldSprite = sprite_index;
	if(inputMagnitude != 0){
		direction = inputDirection;
		sprite_index = spriteRun;
	}else sprite_index = spriteIdle;
	
	if (_oldSprite != sprite_index) localFrame = 0;


	//Update Image Index
	PlayerAnimateSprite()

	//Change State
	if(keyActivate){
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
	}
}

function PlayerStateRoll(){
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	var _collided = PlayerCollision();
	
	//Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + ((1 - (moveDistanceRemaining / distanceRoll)) *_totalFrames);
}
