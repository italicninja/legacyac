gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

-- Create a base profile using the template
local profile = gcinclude.CreateBaseProfile();

-- Job-specific configuration
profile.Config = {
    MacroBook = 11,
    MacroPage = 1
}

-- Define sets first
profile.Sets = {
    ['Idle'] = {
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Spike Earring',
        Ear2 = 'Spike Earring',
        Body = 'Rapparee Harness',
        Hands = 'Battle Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Waist = 'Swift Belt',
        Legs = 'Republic Subligar',
        Feet = 'Leaping Boots',
    },
    Resting = {},
    Idle_Regen = {
    },
    Idle_Refresh = {},
    Town = {
    },
    Dt = {
    },
    Steal = {
        Head = "Rogue's Bonnet",
        Hands = "Rogue's Armlets",
    },
    Tp_Default = {
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
    },
    Tp_Hybrid = {
    },
    Tp_Acc = {
    },
    Precast = {
    },
    Preshot = {
    },
    Ws_Default = {
    },
    Ws_Default_SA = {
    },
    Ws_Default_TA = {
    },
    Ws_Default_SATA = {
    },
    Ws_Hybrid = {
    },
    Ws_Hybrid_SA = {},
    Ws_Hybrid_TA = {},
    Ws_Hybrid_SATA = {},
    Ws_Acc = {
    },
    Ws_Acc_SA = {},
    Ws_Acc_TA = {},
    Ws_Acc_SATA = {},

    Evis_Default = {
        Head = { Name = 'Adhemar Bonnet +1', AugPath='B' },
        Neck = 'Fotia Gorget',
        Ear1 = 'Odr Earring',
        Ear2 = 'Mache Earring +1',
        Body = { Name = 'Plunderer\'s Vest +3', AugTrial=5477 },
        Hands = 'Meg. Gloves +2',
        Ring1 = 'Beithir Ring',
        Ring2 = 'Karieyh Ring +1',
        Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Weapon skill damage +10%', [3] = 'Attack+20', [4] = 'DEX+20' } },
        Waist = 'Fotia Belt',
        Legs = 'Gleti\'s Breeches',
        Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+30', [2] = 'Weapon skill damage +8%', [3] = 'Attack+6', [4] = 'Mag. Acc.+2' } },
    },
    Evis_Default_SA = {
    },
    Evis_Default_TA = {
        
    },
    Evis_Default_SATA = {
    },
    Evis_Hybrid = {
    },
    Evis_Hybrid_SA = {},
    Evis_Hybrid_TA = {},
    Evis_Hybrid_SATA = {},
    Evis_Acc = {
    },
    Evis_Acc_SA = {},
    Evis_Acc_TA = {},
    Evis_Acc_SATA = {},


    SATA = { -- ??
        Ring1 = 'Rajas Ring',
        Ring2 = 'Balance Ring',
        Waist  = 'Mrc.Cpt. Belt',
        Body   = 'Fed. Doublet',
        Ear1  = 'Drone Earring',
        Ear2  = 'Drone Earring',
    },
    SA = { -- DEX
        Ring1 = 'Rajas Ring',
        Ring2 = 'Balance Ring',
        Waist  = 'Mrc.Cpt. Belt',
        Body   = 'Fed. Doublet',
    },
    TA = { -- AGI
        Ring1 = 'Reflex Ring',
        Ring2 = 'Reflex Ring',
        Ear1  = 'Drone Earring',
        Ear2  = 'Drone Earring',
        Waist  = 'Mrc.Cpt. Belt',
        Body   = 'Fed. Doublet',
    },
    TH = {
        Neck = '',
        Hands = '',
    },
    Flee = {
        Feet = '',
    },
    Movement = {
        Feet = '',
	},
    ['Midcast'] = {
    },
    ['Midshot'] = {
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Irn.Msk.Gmbsn. +1',
        Hands = 'Noct Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Legs = 'Noct Brais +1',
        Feet = 'Leaping Boots',
    },
};

-- profile.Packer = {
--     'Odious Blood',
--     'Odious Pen',
--     'Odious Skull',
--     'Odious Horn',
--     {Name = 'Forgotten Hope', Quantity = 'all'},
--     {Name = 'Frgtn. Thought', Quantity = 'all'},
--     'Shrouded Bijou',
--     {Name = 'T. Whiteshell', Quantity = 'all'},
--     {Name = 'O. Bronzepiece', Quantity = 'all'},
--     {Name = '1 Byne Bill', Quantity = 'all'},
-- };

-- Override HandleDefault for THF-specific behavior
profile.HandleDefault = function()
    gFunc.EquipSet(profile.Sets.Idle);
    local sa = gData.GetBuffCount('Sneak Attack');
    local ta = gData.GetBuffCount('Trick Attack');

    local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(profile.Sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')) end
        if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(profile.Sets.TH) end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(profile.Sets.Resting);
    elseif (player.IsMoving == true) then
        gFunc.EquipSet(profile.Sets.Movement);
    end

    if (sa == 1) and (ta == 1) then
        gFunc.EquipSet(profile.Sets.SATA);
    elseif (sa == 1) then
        gFunc.EquipSet(profile.Sets.SA);
    elseif (ta == 1) then
        gFunc.EquipSet(profile.Sets.TA);
    end
    
    gcinclude.CheckDefault();
    if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(profile.Sets.Dt) end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(profile.Sets.Movement) end;
end

-- THF-specific ability handling
profile.HandleAbility = function()
    local ability = gData.GetAction();
    if string.match(ability.Name, 'Flee') then
        gFunc.EquipSet(profile.Sets.Flee);
    end

    gcinclude.CheckCancels();
end

-- THF-specific midcast handling
profile.HandleMidcast = function()
    if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(profile.Sets.TH) end
end

-- Override HandleWeaponskill for THF-specific behavior
profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
        local sa = gData.GetBuffCount('Sneak Attack');
        local ta = gData.GetBuffCount('Trick Attack');
    
        gFunc.EquipSet(profile.Sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
        if (sa == 1) and (ta == 1) then
            gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet') .. '_SATA');
        elseif (sa == 1) then
            gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet') .. '_SA');
        elseif (ta == 1) then
            gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet') .. '_TA');
        end

        if string.match(ws.Name, 'Evisceration') then
            gFunc.EquipSet(profile.Sets.Evis_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet')); end
            if (sa == 1) and (ta == 1) then
                gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet') .. '_SATA');
            elseif (sa == 1) then
                gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet') .. '_SA');
            elseif (ta == 1) then
                gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet') .. '_TA');
            end
        end
    end
end

return profile;