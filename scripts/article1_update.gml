// batit update

if(free){
    vsp += player_id.grav;
}

if(state == 0){
    image_index = floor(article_timer/8);
}

article_timer++;
state_timer++;

#define changeState(newState)
state = newState;
state_timer = 0;

#define despawn()
player_id.batitPlaced = false;
instance_destroy();
exit;