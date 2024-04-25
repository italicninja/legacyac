local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local sets = {
    Idle = {
        Main = gcinclude.staves["Earth"],
        Head = 'Brd. Roundlet +1',
        Neck = 'Bird Whistle',
        Ear1 = 'Melody earring',
        Ear2 = 'Melody earring',
        Body = 'Sha\'ir manteel',
        Hands = 'Choral Cuffs',
        Ring1 = 'Angel\'s Ring',
        Ring2 = 'Minstrel\'s Ring',
        Back = "Jester\'s Cape +1",
        Waist = 'Corsette',
        Legs = 'Bard\'s Cannions',
        Feet = 'Savage Gaiters',
    },
    Resting = {
        Main = "Dark Staff",
        Neck = "Checkered Scarf",
        Body = "Errant Hpl.",
        Legs = "Baron's Slops",
        Feet = "Shep. Boots",
    },
    Idle_Regen = {
    },
    Idle_Refresh = {
    },
	Town = {
		Body = 'Ducal Aketon',
    },
    Dt = {
    },
    ['hp_drop'] = {
        Main = gcinclude.staves["Earth"],
        Head = 'Gold Hairpin',
        Body = 'Kirin\'s Osode', -- 10 All Stats
        Hands = 'Errant Cuffs',
        Ring1 = 'Ether Ring',
        Ring2 = 'Astral Ring',
		Neck = "Checkered Scarf",
        Back = 'Blue Cape',
        Waist = 'Scouter\'s Rope',
		Legs = "Hydra Brais",
        Feet = 'Rostrum Pumps', -- This slot is dead since we use R Pumps in precast
    },
    ['Tp_Default'] = {
        Range = 'Frenzy Fife',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beetle Earring +1',
        Body = 'Bard\'s Jstcorps',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Courage Ring',
        Ring2 = 'Courage Ring',
        Back = 'Bard\'s Cape',
        Waist = 'Gleeman\'s Belt',
        Legs = 'Choral Cannions',
        Feet = 'Choral Slippers',
    },
    Tp_Hybrid = {
    },
    Tp_Acc = {
    },
    Precast = {
        Ear2 = 'Loquac. Earring',
        Feet = 'Rostrum Pumps',
    },
    Cure_Precast = {
        Main = gcinclude.staves["Light"],
		Body = "Errant Hpl.",
        Feet = 'Errant Pigaches',
    },
    Enhancing_Precast = {
    },
    Stoneskin_Precast = {
    },
    hmp = {
		Main = "Dark Staff",
		Neck = "Checkered Scarf",
		Body = "Errant Hpl.",
		Legs = "Hydra Brais",
		Feet = "Shep. Boots",
		Ear1 = "Magnetic Earring",
	},
    ['Song_Midcast'] = {
        Head = 'Brd. Roundlet +1',
        Neck = 'Bird Whistle',
		Ear1 = "Beastly earring",
        Ear2 = 'Melody earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Bard\'s Cuffs',
        Ring1 = 'Angel\'s Ring',
        Ring2 = 'Angel\'s Ring',
        Waist = 'Gleeman\'s Belt',
        Back = "Jester\'s Cape +1",
        Legs = 'Bard\'s Cannions',
        Feet = 'Bard\'s Slippers',
    },
    -- Should be HP+ aand any precast stuff like Minstrel's Ring and Manteel
    ['Song_Precast'] = {
        Head = 'Brd. Roundlet +1',
        Neck = 'Bird Whistle',
		Ear1 = "Beastly earring",
        Ear2 = 'Melody earring',
        Body = 'Sha\'ir manteel',
        Hands = 'Bard\'s Cuffs',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Minstrel\'s Ring',
        Waist = 'Gleeman\'s Belt',
        Back = "Jester\'s Cape +1",
        Legs = 'Choral Cannions',
    },
    Self_Cure = {
    },
    Regen = {
    },
    Cursna = {
    },
    Enhancing = {
    },
    Stoneskin = { -- +MND [ BASE = Enhancing/3 + MND]
        Head = 'Choral Roundlet', -- 3 MND
        Neck = 'Justice Badge', -- 3 MND
        Body = 'Kirin\'s Osode', -- 10 All Stats
        Legs = 'Choral Cannions', -- 8 MND
    },
    Cure = {
        main = gcinclude.staves["Light"],
        Body = 'Kirin\'s Osode',
    },
    Refresh = {
		Waist = 'Gishdubar Sash',
    },

    Enfeebling = {
    },
    -- Song Types
    Wind = {
        Body = 'Choral Jstcorps',
        Legs = 'Choral Cannions',
    },
    String = {
        Hands = 'Bard\'s Cuffs',
        Neck = 'String Torque',
        Feet = 'Bard\'s Slippers',
    },
    -- Specific Songs
    Harp = {
        Range = 'Ebony Harp +2',
    },
    Foe = {
        Range = 'Nursemaid\'s Harp',
        Body = 'Kirin\'s Osode',
    },
    Horde = {
        Range = 'Nursemaid\'s Harp',
        Body = 'Kirin\'s Osode',
    },
    Buff = {
    },
    Paeon = {
        Range = 'Ebony Harp +2',
    },
	Minne = {
        Range = 'Maple Harp +1',
    },
    Mazurka = {
        Range = 'Harlequin\'s Horn',
    },
    Elegy = {
        Range = 'Horn +1',
        Body = 'Kirin\'s Osode',
    },
	Minuet = {
        Range = 'Cornette +1',
    },
    March = {
        Range = 'Faerie Piccolo',
    },
    Madrigal = {
        Range = 'Traversiere +1',
    },
    Ballad = {
        Range = 'Horn +1',
    },
    Threnody = {
        Range = 'Sorrowful Harp',
    },
    Scherzo = {
        Range = 'Ebony Harp +2',
    },

    Drain = {},
    Nuke = {},
    Preshot = {},
    Midshot = {
        Ear1 = 'Telos Earring',
        Ear2 = 'Crep. Earring',
    },

    Ws_Default = {
        Range = 'Linos',
        Head = 'Nyame Helm',
        Neck = 'Fotia Gorget',
        Ear1 = 'Mache Earring +1',
        Ear2 = 'Telos Earring',
        Body = 'Bihu Jstcorps. +3',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Karieyh Ring +1',
        Back = { Name = 'Intarabus\'s Cape', Augment = { [1] = 'STR+7', [2] = 'Weapon skill damage +10%', [3] = 'Attack+6', [4] = 'Accuracy+6' } },
        Waist = 'Fotia Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Bihu Slippers +3',
    },
    Ws_Hybrid = {},
    Ws_Acc = {},

    Savage_Default = {
        Range = 'Linos',
        Neck = 'Bard\'s Charm +1',
        Body = 'Bihu Jstcorps. +3',
        Ring1 = 'Petrov Ring',
        Ring2 = 'Karieyh Ring +1',
        Back = { Name = 'Intarabus\'s Cape', Augment = { [1] = 'STR+7', [2] = 'Weapon skill damage +10%', [3] = 'Attack+6', [4] = 'Accuracy+6' } },
        Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
    },
    Savage_Hybrid = {},
    Savage_Acc = {},

    Nitro = {
        Body = 'Bihu Jstcorps. +3',
        Legs = 'Bihu Cannions +1',
        Feet = 'Bihu Slippers +3',
    },

    TH = {
        Ammo = 'Per. Lucky Egg',
		Waist = 'Chaac Belt',
	},
    Movement = {
        Feet = 'Fili Cothurnes +1',
	},
};
profile.Sets = sets;

profile.Packer = {
    --{Name = 'Chonofuda', Quantity = 'all'},
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 6');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
    -- AshitaCore:GetChatManager():QueueCommand(1, '/anon');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
    --gFunc.EquipSet(sets.Idle);
    gFunc.EquipSet(sets['hp_drop']); -- Idle in -HP gear
	local player = gData.GetPlayer();

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
			gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')) end
		if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
        if (gcdisplay.GetToggle('Fight') == false) then AshitaCore:GetChatManager():QueueCommand(1, '/fight') end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end

    gcinclude.CheckDefault ();
    if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    if string.match(ability.Name, 'Troubadour') or string.match(ability.Name, 'Nightingale') or string.match(ability.Name, 'Soul Voice') then gFunc.EquipSet(sets.Nitro) end

    --gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();

    gFunc.EquipSet(sets.Precast) -- Base Precast Gear

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing_Precast);

        if string.contains(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin_Precast);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure_Precast);
    elseif (spell.Skill == 'Singing') then
        gFunc.EquipSet(sets.Song_Precast);
    end

    --gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);

        if string.contains(spell.Name, 'Cure') then
            gFunc.EquipSet(sets.Cure);
        elseif string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, 'Refresh') then
            gFunc.EquipSet(sets.Refresh);
        elseif string.contains(spell.Name, 'Regen') then
            gFunc.EquipSet(sets.Regen);
        end

	    gcinclude.CheckCommonBuffs()
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
        if (target.Name == me) then
            gFunc.EquipSet(sets.Self_Cure);
        end
        if string.match(spell.Name, 'Cursna') then
            gFunc.EquipSet(sets.Cursna);
        end
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);

        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            gFunc.Equip('Waist', 'Hachirin-no-Obi');
        end
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Enfeebling); -- mostly macc anyways
        if (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
            gFunc.EquipSet(sets.Drain);
        end
    elseif (spell.Skill == 'Singing') then
        gFunc.EquipSet(sets.Song_Midcast);
        if (string.contains(spell.Name, 'Paeon')) or (string.contains(spell.Name, 'Mazurka')) then
            gFunc.EquipSet(sets.Paeon);
        else
            gFunc.EquipSet(sets.Buff);
        end
        if (string.contains(spell.Name, 'Requiem')) or (string.contains(spell.Name, 'Elegy')) or (string.contains(spell.Name, 'Finale')) or (string.contains(spell.Name, 'Lullaby')) then
            gFunc.EquipSet(sets.Wind);
        end
        if (string.contains(spell.Name, 'Horde Lullaby')) then
            gFunc.EquipSet(sets.Horde);
        elseif (string.contains(spell.Name, 'Foe Lullaby')) then
            gFunc.EquipSet(sets.Foe);
        elseif (string.contains(spell.Name, 'March')) then
            gFunc.EquipSet(sets.March);
        elseif (string.contains(spell.Name, 'Madrigal')) then
            gFunc.EquipSet(sets.Madrigal);
        elseif (string.contains(spell.Name, 'Elegy')) then
            gFunc.EquipSet(sets.Elegy);
		elseif (string.contains(spell.Name, 'Minne')) then
            gFunc.EquipSet(sets.Minne);
		elseif (string.contains(spell.Name, 'Minuet')) then
            gFunc.EquipSet(sets.Minuet);
        elseif (string.contains(spell.Name, 'Scherzo')) then
            gFunc.EquipSet(sets.Scherzo);
        elseif (string.contains(spell.Name, 'Ballad')) then
            gFunc.EquipSet(sets.Ballad);
        elseif (string.contains(spell.Name, 'Threnody')) then
            gFunc.EquipSet(sets.Threnody);
        elseif (string.contains(spell.Name, 'Mazurka')) then
            gFunc.EquipSet(sets.Mazurka);
        end

        if (gcdisplay.GetToggle('String') == true) then
            gFunc.EquipSet(sets.Harp);
        end
    end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();

        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end

        if string.match(ws.Name, 'Savage Blade') then
            gFunc.EquipSet(sets.Savage_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Savage_' .. gcdisplay.GetCycle('MeleeSet')); end
        end
    end
end

return profile;