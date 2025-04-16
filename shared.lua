return {
    command = 'scenemenu',
    keybind = 'O', -- set to false to disable the keybind

    scenes = {
        {
            label = 'Open Laptop',
            dict = 'anim@gangops@morgue@office@laptop@',
            objects = { 'xm_prop_x17_laptop_mrsr', 'hei_prop_hst_usb_drive' },
            animations = {
                { player = 'enter', objects = {'enter_laptop', 'enter_usb'}, duration = 4000 },
                { player = 'idle', objects = {'idle_laptop', 'idle_usb'}, duration = 10000 },
                { player = 'exit', objects = {'exit_laptop', 'exit_usb'}, duration = 4000 },
            }
        }, 
        {
            label = 'Smoke Bong',
            dict = 'anim@safehouse@bong',
            objects = { 'prop_sh_bong_01', 'p_cs_lighter_01' },
            animations = {
                { player = 'bong_stage1', objects = {'bong_stage1_bong', 'bong_stage1_lighter'}, duration = 5000 },
            }
        }, 
        {
            label = 'Empty Crate',
            dict = 'anim@scripted@player@mission@trn_ig2_empty@male@',
            objects = { 'xm3_prop_xm3_crate_01a', 'w_me_crowbar' },
            animations = {
                { player = 'empty', objects = {'empty_crate', 'empty_crowbar'}, duration = 6000 },
            }
        }, 
        {
            label = 'Rob Store',
            dict = 'mp_am_hold_up',
            objects = { 'p_poly_bag_01_s', 'p_till_01_s' },
            animations = {
                { player = 'holdup_victim_20s', objects = {'holdup_victim_20s_bag', 'holdup_victim_20s_till'}, duration = 24000 },
            }
        },
        {
            label = 'Open Chest',
            dict = 'anim@scripted@heist@ig20_chest_land@male@',
            objects = { 'h4_prop_h4_chest_01a', 'h4_prop_h4_gold_coin_01a', 'h4_prop_h4_gold_pile_01a' },
            animations = {
                { player = 'action_male', objects = {'action_chest', 'action_coin', 'action_coinpile'}, duration = 8000 },
            }
        },
    },

}