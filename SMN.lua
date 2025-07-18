---@diagnostic disable: undefined-global

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
    MacroBook = 2,
    MacroPage = 1
}

-- Override OnLoad to use our config
profile.OnLoad = function()
    baseProfile.OnLoad(profile.Config);
    gSettings.AllowSyncEquip = false;
end

local bookSMN = 2  -- Macro Book for SMN
local pageIdle = 1  -- Macro Page to Idle on

local petMacroPage = {
	["Ifrit"] = 6,
	["Titan"] = 8,
	["Levithan"] = 5,
	["Garuda"] = 4,
	["Shiva"] = 3,
	["Ramuh"] = 7,
	["Fenrir"] = 9,
	["Diabolos"] = 10,
}
-- Phase [Acc, Eva]
--   local fenrirCryChart = {
--  "New Moon" = [1, 31],
-- 	"Waxing Crescent" = [6, 26],
-- 	"Waxing Crescent" = [11, 21],
-- 	"First Quarter Moon" = [16, 16],
-- 	"Waxing Gibbous" = [21, 11],
-- 	"Waxing Gibbous" = [26, 6],
-- 	"Full Moon" = [31, 1],
-- 	"Waning Gibbous" = [26, 6],
-- 	"Waning Gibbous" = [21, 11],
-- 	"Last Quarter Moon" = [16, 16],
-- 	"Waning Crescent" = [11, 21],
-- 	"Waning Crescent" = [6, 26],

--   }
local profile = {}
profile.Sets = {
	Idle = {
		--main = staff["Fire"],
		Ammo = "Hedgehog Bomb",
		Head = "Smn. Horn +1",
		Ear1 = "Magnetic Earring",
		Ear2 = "Beastly earring",
		Ring1 = "Evoker's Ring",
		Ring2 = "Ether Ring",
		Body = "Yinyang Robe",
		Hands = "Smn. Bracers +1",
		Back = "Summoner's Cape",
		Waist = "Hierarch Belt",
		Legs = "Smn. Spats +1",
		Feet = "Nashira Crackows",
	},
	perp = {
		--Body = "Yinyang Robe", -- Not really perp but the +1 Refresh is kinda like it
		Ring1 = "Evoker's Ring",
		Hands = "Nashira Gages",
		Feet = "Evk. Pigaches +1",
	},
	hmp = {
		Main = gcinclude.staves['Dark'],
		Neck = "Checkered Scarf",
		Body = "Errant Hpl.",
		Legs = "Hydra Brais",
		Ear1 = "Magnetic Earring",
		Ear2 = "Relaxing Earring",
	},
	Nuke = {
		Hands = "Nashira Gages", -- MaCC
	},
	Cure = {
		main = gcinclude.staves['Light'],
	},
	Stoneskin = {},
	FastCast = {
		Ear2 = "Loquac. Earring",
        Feet = 'Rostrum Pumps',
	},
	MidCast = {
		Ear1 = "Magnetic Earring",
	},
	petMAB = {
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Hands = "Smn. Bracers +1",
		Ring1 = "Evoker's Ring",
	},
	petAtk = {
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Hands = "Smn. Bracers +1",
		Ring1 = "Evoker's Ring",
	},
	SummonSkill = {
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Hands = "Smn. Bracers +1",
		Ring1 = "Evoker's Ring",
		Feet = "Nashira Crackows",
		Back = "Astute Cape",
	},
	petMacc = {
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Hands = "Smn. Bracers +1",
		Ring1 = "Evoker's Ring",
	},
	BPDelay = {
		Head = "Smn. Horn +1",
		Hands = "Smn. Bracers +1",
		Body = "Yinyang Robe",
		Legs = "Smn. Spats +1",
		Feet = "Smn. Pigaches +1",
	},
	['sync40'] = {
        Main = 'Kukulcan\'s Staff',
        Head = 'Horn Hairpin +1',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Seer\'s Tunic +1',
        Hands = 'Carbuncle Mitts',
        Ring1 = 'Astral Ring',
        Ring2 = 'Ether Ring',
        Back = 'Cape +1',
        Waist = 'Friar\'s Rope',
        Legs = 'Savage Loincloth',
        Feet = 'Savage Gaiters',
		Ammo = 'Fortune Egg',
    },
	Town = {
		Body = 'Ducal Aketon',
    },
	Idle_Regen = {
        Neck = 'Bathy Choker +1',
    },
    Idle_Refresh = {
		Body = "Yinyang Robe",
    },
	Dt = {
    },
	day = {
        Neck = 'Fenrir\'s Torque',
    },
	night = {
    },
	pet_Dt = {
    },
    ['sync60'] = {
        Head = 'Evoker\'s Horn',
        Neck = 'Checkered Scarf',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Savage Separates',
        Hands = 'Evoker\'s Bracers',
        Ring1 = 'Astral Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Cape +1',
        Waist = 'Friar\'s Rope',
        Legs = 'Savage Loincloth',
        Feet = 'Savage Gaiters',
    },
    ['tp_default'] = {
        Ammo = 'Hedgehog Bomb',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Brutal Earring',
        Body = 'Yinyang Robe',
        Hands = 'Carbuncle Mitts',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Summoner\'s Cape',
        Waist = 'Swift Belt',
		Legs = "Hydra Brais",
        Feet = 'Evk. Pigaches +1',
    },
    ['sync50'] = {
        Main = 'Kukulcan\'s Staff',
        Ammo = 'Fortune Egg',
        Head = 'Horn Hairpin +1',
        Neck = 'Peacock Amulet',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Seer\'s Tunic +1',
        Hands = 'Dream Mittens +1',
        Ring1 = 'Astral Ring',
        Ring2 = 'Ether Ring',
        Back = 'Skulker\'s Cape',
        Waist = 'Swift Belt',
        Legs = 'Savage Loincloth',
        Feet = 'Dream Boots +1',
    },
}

profile.Packer = {}

--Bloodpact Lists. I have flaming crush in the PhysicalBP list which may not be optimal.
--CritBPs (Predator Claws and Chaotic Strike) should be separated and used with Summoner's Doublet and any other pet: crit we find.
local MagicBP = T({
	"Meteorite",
	"Stone II",
	"Stone IV",
	"Geocrush",
	"Water II",
	"Water IV",
	"Grand Fall",
	"Aero II",
	"Aero IV",
	"Wind Blade",
	"Fire II",
	"Fire IV",
	"Meteor Strike",
	"Burning Strike",
	"Blizzard II",
	"Blizzard IV",
	"Heavenly Strike",
	"Thunder II",
	"Thunder IV",
	"Thunderstorm",
	"Thunderspark",
})
local PhysBP = T({
	"Poison Nails",
	"Moonlit Charge",
	"Somnolence",
	"Punch",
	"Rock Throw",
	"Barracuda Dive",
	"Claw",
	"Axe Kick",
	"Shock Strike",
	"Camisado",
	"Regal Scratch",
	"Crescent Fang",
	"Rock Buster",
	"Tail Whip",
	"Double Punch",
	"Megalith Throw",
	"Double Slap",
	"Eclipse Bite",
	"Flaming Crush",
	"Mountain Buster",
	"Spinning Dive",
	"Predator Claws",
	"Rush",
	"Chaotic Strike",
})
local BuffBP = T({
	"Shining Ruby",
	"Aerial Armor",
	"Frost Armor",
	"Rolling Thunder",
	"Crimson Howl",
	"Lightning Armor",
	"Ecliptic Growl",
	"Glittering Ruby",
	"Earthen Ward",
	"Spring Water",
	"Hastega",
	"Noctoshield",
	"Ecliptic Howl",
	"Dream Shroud",
})
local DebuffBP = T({
	"Lunar Cry",
	"Mewing Lullaby",
	"Nightmare",
	"Lunar Roar",
	"Slowga",
	"Ultimate Terror",
	"Sleepga",
	"Eerie Eye",
})

--petElement gets set when you cast an avatar so we can match it to day/weather/staff
local petElement = "Light"

local function HandlePetAction(PetAction)
	local BPName = PetAction.Name
	if MagicBP:contains(BPName) then
		gFunc.EquipSet(profile.Sets.petMAB)
	elseif PhysBP:contains(BPName) then
		gFunc.EquipSet(profile.Sets.SummonSkill) -- SMN Skill adds Damage in HorizonXI
		gFunc.EquipSet(profile.Sets.petAtk)
	elseif BuffBP:contains(BPName) then
		gFunc.EquipSet(profile.Sets.SummonSkill)
	elseif DebuffBP:contains(BPName) then
		gFunc.EquipSet(profile.Sets.petMacc)
	end
end

local function SetMacros(book, set)
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book " .. book)
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set " .. set)
end

-- Use the SetMacros function in our OnLoad
profile.OnLoad = function()
    baseProfile.OnLoad(profile.Config);
    gSettings.AllowSyncEquip = false;
    SetMacros(bookSMN, pageIdle);
    --AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 1');
end

-- Override HandleDefault for SMN-specific behavior
profile.HandleDefault = function()
    local game = gData.GetEnvironment();
    local petAction = gData.GetPetAction()
    if petAction ~= nil then
        HandlePetAction(petAction)
        return
    end
    local player = gData.GetPlayer()
    local pet = gData.GetPet()
    local env = gData.GetEnvironment()
    local moon_table = gcinclude.GetMoon();
    local moon_phase = moon_table.MoonPhase;
    local moon_percent = moon_table.MoonPhasePercent;
    if (game.Time > 6.00) or (game.Time < 18.00) then
        gFunc.EquipSet(profile.Sets.day);
    else
        gFunc.EquipSet(profile.Sets.night);
    end
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(profile.Sets.tp_default)
    elseif player.Status == "Resting" then
        gFunc.EquipSet(profile.Sets.hmp)
    elseif pet == nil then
        gFunc.EquipSet(profile.Sets.Idle)
    else
        gFunc.EquipSet(profile.Sets.perp)
        gFunc.Equip("main", gcinclude.staves[petElement])
        if pet.Name == "Carbuncle" then
            gFunc.Equip("hands", "Carbuncle Mitts")
        end
        --if pet.Name == "Fenrir" then
            -- local  =
            --print(chat.header('GCinclude'):append(chat.message("Lunar Cry: Acc-" .. moon_phase .. " Eva-" .. moon_percent)));
            --print(chat.header('GCinclude'):append(chat.message("Ecliptic Howl: Acc+" .. moon_phase .. " Eva+" .. moon_percent)));
        --end
        if (env.DayElement == petElement) then --and (pet.Name ~= "Carbuncle")
            -- print(chat.header('GCinclude'):append(chat.message("Day: " .. env.DayElement .. " Pet: " .. petElement)));
            gFunc.Equip("body", 'Smn. Doublet +1')
        end
        if env.WeatherElement == petElement then
            gFunc.Equip("head", "Smn. Horn +1")
        end
    end
    gcinclude.CheckDefault();
end

-- SMN-specific ability handling
profile.HandleAbility = function()
    local action = gData.GetAction()
    if action.Type:contains("Blood Pact") then
        gFunc.EquipSet(profile.Sets.BPDelay)
        --print(chat.header('GCinclude'):append(chat.message(action.Type)));
    end
    if action.Type:contains("Rage") then
        gFunc.EquipSet(profile.Sets.SummonSkill) -- Rage skills scale off Summoner Magic Skill on HorizonXI - https://discord.com/channels/933423693848260678/933752333668606002/1332425149806280795
        --print(chat.header('GCinclude'):append(chat.message(action.Type)));
    end
end

-- Override HandlePrecast for SMN-specific behavior
profile.HandlePrecast = function()
    local action = gData.GetAction()
    gFunc.EquipSet(profile.Sets.FastCast)
    if action.Skill == "Summoning" then
        gFunc.Equip("feet", "Evoker's Boots") -- -1 Summoning Cast Time
    end
end

-- Override HandleMidcast for SMN-specific behavior
profile.HandleMidcast = function()
    local petAction = gData.GetPetAction()
    if petAction ~= nil then
        HandlePetAction(petAction)
        return
    end
    local action = gData.GetAction()

    gFunc.EquipSet(profile.Sets.MidCast)

    if action.Name:contains("Cur") then
        gFunc.EquipSet(profile.Sets.Cure)
    elseif action.Name == "Stoneskin" then
        gFunc.EquipSet(profile.Sets.Stoneskin)
    elseif action.Skill == "Elemental Magic" then
        gFunc.EquipSet(profile.Sets.Nuke)
    elseif action.Skill == "Summoning" then
        petElement = action.Element
    elseif action.ActionType == "Spell" then
        if (action.Name == 'Sneak') then
            gFunc.Equip("feet", "Dream Boots +1") -- Sneak +1
            gFunc.Equip("back", "Skulker\'s Cape") -- Sneak +1 // Invis +1
        elseif (action.Name == 'Invisible') then
            gFunc.Equip("hands", "Dream Mittens +1") -- Invis +1
            gFunc.Equip("back", "Skulker\'s Cape") -- Sneak +1 // Invis +1
        end
        gFunc.Equip('main', gcinclude.staves[action.Element]);
    end
end

return profile
