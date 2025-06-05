gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

-- Create a base profile using the template
local baseProfile = gcinclude.CreateBaseProfile();
local profile = {};

-- Copy base functions
for k, v in pairs(baseProfile) do
    profile[k] = v
end

-- Job-specific configuration
profile.Config = {
    MacroBook = 6,
    MacroPage = 1
}

-- Override OnLoad to use our config
profile.OnLoad = function()
    baseProfile.OnLoad(profile.Config);
end

-- Define sets
local sets = {
    Idle = {
        Main = gcinclude.staves["Earth"],
        Head = 'Brd. Roundlet +1',
        Neck = 'Wind Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Musical Earring',
        Body = 'Sha\'ir manteel', -- Royal Cloak
        Hands = 'Chl. Cuffs +1', -- Zenith Mitts
        Ring1 = 'Astral Ring',
        Ring2 = 'Ether Ring',
        Back = "Blue Cape",  -- Astute Cape
        Waist = 'Scouter\'s Rope',
        Legs = 'Zenith Slacks',
        Feet = 'Rostrum Pumps',
        Range = 'Hamelin Flute',
    },
    Resting = {
        Main = gcinclude.staves["Dark"],
		Neck = "Checkered Scarf",
		Body = "Errant Hpl.",
		Legs = "Hydra Brais",
		Ear1 = "Magnetic Earring",
    },
    Idle_Regen = { },
    Idle_Refresh = { },
	Town = {
		Body = 'Ducal Aketon',
    },
    Dt = {},
    ['Tp_Default'] = {
        Range = 'Frenzy Fife',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beetle Earring +1',
        Body = 'Bard\'s Jstcorps',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Bard\'s Cape',
        Waist = 'Swift Belt',
		Legs = "Hydra Brais",
        Feet = 'Choral Slippers',
    },
    Ws_Default = {
    },
    Tp_Hybrid = {
    },
    Tp_Acc = {
    },
    Precast = {
        Ear1 = 'Loquac. Earring',
        Feet = 'Rostrum Pumps',
    },
    Cure_Precast = {
        Main = gcinclude.staves["Light"],
		Body = "Errant Hpl.",
        Feet = 'Errant Pigaches',
    },
    Enhancing_Precast = {},
    ['Song_Midcast'] = { -- + Skill and Stuff
        Head = 'Brd. Roundlet +1',
        Neck = 'Bird Whistle',
		Ear1 = "Beastly earring",
        Ear2 = 'Musical earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Choral\'s Cuffs',
        Ring1 = 'Angel\'s Ring',
        Ring2 = 'Angel\'s Ring',
        Waist = 'Gleeman\'s Belt',
        Back = "Jester\'s cape +1",  -- Astute Cape
        Legs = 'Bard\'s Cannions',
        Feet = 'Bard\'s Slippers',
    },
    -- Should be HP+ and any precast stuff like Minstrel's Ring and Manteel
    ['Song_Precast'] = {
        Back = "Gigant Mantle",
        Body = 'Sha\'ir manteel',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Musical Earring',
        Feet = 'Rostrum Pumps',
        Hands = 'Bard\'s Cuffs', -- Sha'ir Gages
        Head = 'Genbu\'s Kabuto',
        Legs = 'Zenith Slacks',
        Main = 'Tutelary',
        Neck = 'Shield Pendant',
        Ring2 = 'Bomb Queen Ring',
        Ring1 = 'Minstrel\'s Ring',
        Waist = 'Gleeman\'s Belt',
    },
    Self_Cure = {},
    Regen = {},
    Cursna = {},
    Enhancing = {},
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
    Refresh = {},
    Enfeebling = {},
    -- Song Types
    Wind = {
        Body = 'Choral Jstcorps',
        Legs = 'Choral Cannions',
        Ear2 = 'Musical Earring',
    },
    String = {
        Hands = 'Bard\'s Cuffs',
        Neck = 'String Torque',
        Feet = 'Bard\'s Slippers',
        Ear2 = 'Musical Earring',
    },
    -- Specific Songs
    Harp = {
        Range = 'Ebony Harp +2',
    },
    Lullaby = { -- Debuff Song: Lullaby (Stack CHR) *Includes Haste gear*
        Range = 'Nursemaid\'s Harp',
        Body = 'Kirin\'s Osode',
    },
    Buff = { },
    Paeon = { -- Buff Song: Paeon (Stack Singing/String Skill) *Includes Haste gear*
        Range = 'Ebony Harp +2',
    },
	Minne = { -- Buff Song: Minuet (Stack Singing/Wind Skill) *Includes Haste gear*
        Range = 'Maple Harp +1',
    },
    Mazurka = { -- Buff Song: Mazurka (--) *Includes Haste gear*
        Range = 'Harlequin\'s Horn',
    },
    Etude = { -- Buff Song: Etude (Stack Singing/String Skill) *Includes Haste gear*
        Range = 'Rose Harp +1',
    },
    Elegy = { -- Debuff Song: Elegy (Stack CHR & Singing/Wind Skill) *Includes Haste gear*
        Main = "Chanter's Staff",
        Head = "Brd. Roundlet +1",
        Body = "Kirin's Osode",
        Hands = "Chl. Cuffs +1",
        Legs = "Chl. Cannions +1",
        Feet = "Sha'ir Crackows",
        Back = "Jester's Cape +1",
        Neck = "Wind Torque",
        Waist = "Gleeman's Belt",
        Ear1 = "Beastly Earring",
        Ear2 = "Musical Earring",
        Ring1 = "Angel's ring",
        Ring2 = "Luftpause Mark",
        Range = 'Horn +1'
    },
    Requiem = { -- Debuff Song: Elegy (Stack CHR & Singing/Wind Skill) *Includes Haste gear*
        Main = "Chanter's Staff",
        Head = "Brd. Roundlet +1",
        Body = "Kirin's Osode",
        Hands = "Chl. Cuffs +1",
        Legs = "Chl. Cannions +1",
        Feet = "Sha'ir Crackows",
        Back = "Jester's Cape +1",
        Neck = "Wind Torque",
        Waist = "Gleeman's Belt",
        Ear1 = "Beastly Earring",
        Ear2 = "Musical Earring",
        Ring1 = "Angel's ring",
        Ring2 = "Luftpause Mark",
        Range = 'Shofar +1'
    },
    Finale = { -- Debuff Song: Finale (Stack CHR) *Includes Haste gear*
        Main = "Chanter's Staff",
        Head = "Brd. Roundlet +1",
        Body = "Kirin's Osode",
        Hands = "Chl. Cuffs +1",
        Legs = "Chl. Cannions +1",
        Feet = "Sha'ir Crackows",
        Back = "Jester's Cape +1",
        Neck = "Wind Torque",
        Waist = "Gleeman's Belt",
        Ear1 = "Beastly Earring",
        Ear2 = "Musical Earring",
        Ring1 = "Angel's ring",
        Ring2 = "Luftpause Mark",
        Range = 'Hamelin Flute',
    },
	Minuet = {
        Range = 'Cornette +1',
    },
    March = { -- Buff Song: March (Stack Singing/Wind Skill) *Includes Haste gear*
        Main = "Chanter's Staff",
        Range = 'Faerie Piccolo',
        Head = "Brd. Roundlet +1",
        Body = "Minstrel's Coat",
        Hands = "Chl. Cuffs +1",
        Legs = "Chl. Cannions +1",
        Feet = "Rostrum Pumps",
        --Back = "Astute Cape",
        Neck = "Wind Torque",
        Waist = "Gleeman's Belt",
        Ear1 = "Beastly Earring,",
        Ear2 = "Musical Earring",
        Ring1 = "Minstrel's Ring",
        Ring2 = "Angel's Ring",
    },
    Madrigal = {
        Range = 'Traversiere +1',
    },
    Ballad = { -- Buff Song: Ballad (Stack Haste)
        Main = "Chanter's Staff",
        Range = 'Faerie Piccolo',
        Head = "Brd. Roundlet +1",
        Body = "Sha'ir Manteel",
        Hands = "Chl. Cuffs +1",
        Legs = "Chl. Cannions +1",
        Feet = "Sha'ir Crackows",
        Back = "Astute Cape",
        Neck = "Wind Torque",
        Waist = "Swift Belt",
        Ear1 = "Beastly Earring,",
        Ear2 = "Musical Earring",
        Ring1 = "Angel's Ring",
        Ring2 = "Angel's Ring",
    },
    Threnody = {
        Range = 'Sorrowful Harp',
    },
    Carol = { -- Buff Song: Carol (Stack Singing/Wind Skill)
        Range = 'Crumhorn +1',
    },
    Scherzo = {
        Range = 'Ebony Harp +2',
    },
    Drain = {},
    Nuke = {},
    Preshot = {},
    Midshot = {},
    Ws_Hybrid = {},
    Ws_Acc = {},
    Savage_Default = {},
    Savage_Hybrid = {},
    Savage_Acc = {},
    Nitro = {},
    TH = {},
    Movement = {},
};
profile.Sets = sets;

local marchTiers = { 600, 594, 587, 580, 573, 567, 560, 553, 546, 540, 533, 526, 519, 513, 506, 499, 492, 486, 479, 472, 465, 459, 452, 445, 0 }

profile.Packer = {
    --{Name = 'Chonofuda', Quantity = 'all'},
};

-- Override HandleDefault to add BRD-specific behavior
profile.HandleDefault = function()
    gFunc.EquipSet(sets.Idle);
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

    gcinclude.CheckDefault();
    if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
end

-- BRD-specific ability handling
profile.HandleAbility = function()
    -- local ability = gData.GetAction();
    -- if string.match(ability.Name, 'Troubadour') or string.match(ability.Name, 'Nightingale') or string.match(ability.Name, 'Soul Voice') then gFunc.EquipSet(sets.Nitro) end
    --gcinclude.CheckCancels();
end

-- Override HandlePrecast for BRD-specific behavior
profile.HandlePrecast = function()
    local spell = gData.GetAction();

    gFunc.EquipSet(sets.Precast) -- Base Precast Gear

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing_Precast);
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
    local me = AshitaCore:GetMemoryManager():GetPlayer();
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
        if (string.contains(spell.Name, 'Lullaby')) then
            gFunc.EquipSet(sets.Lullaby);
        elseif (string.contains(spell.Name, 'March')) then
            gFunc.EquipSet(sets.March);
        elseif (string.contains(spell.Name, 'Paeon')) then
            gFunc.EquipSet(sets.Paeon);
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
        elseif (string.contains(spell.Name, 'Requiem')) then
            gFunc.EquipSet(sets.Requiem);
        elseif (string.contains(spell.Name, 'Carol')) then
            gFunc.EquipSet(sets.Carol);
        end

        if (gcdisplay.GetToggle('String') == true) then
            gFunc.EquipSet(sets.Harp);
        end
    end
    -- Output skills
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