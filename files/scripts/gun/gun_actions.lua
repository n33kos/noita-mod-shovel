table.insert(actions, {
    id          = "SHOVEL",
    name 		= "Shovel",
    description = "Dig your way down",
    sprite 		= "",
    sprite_unidentified = "data/ui_gfx/gun_actions/digger_unidentified.png",
    type 		= ACTION_TYPE_PROJECTILE,
    spawn_level                       = "",
    spawn_probability                 = "",
    price = 70,
    mana = 0,
    sound_loop_tag = "sound_digger",
    action 		= function()
        add_projectile("mods/shovel/files/entities/projectiles/deck/shovel.xml")
        c.fire_rate_wait = c.fire_rate_wait + 1
        current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE
    end,
})