//hit player

// check whether to finish Dattack or not
if(my_hitboxID.attack == AT_DATTACK && my_hitboxID.hbox_num == get_num_hitboxes(AT_DATTACK) - 1) finishDattack = true;

// check whether to finish Uair or not
if(my_hitboxID.attack == AT_UAIR && my_hitboxID.hbox_num == 2) finishUair = true;

// check whether you hit fspecial_2
if(my_hitboxID.attack == AT_FSPECIAL_2) whipHitPlayer = true;