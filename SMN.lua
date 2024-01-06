---@diagnostic disable: undefined-global

gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local staff = {
    ['Fire'] = 'Vulkan\'s Staff',
    ['Earth'] = 'Earth Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'Wind Staff',
    ['Ice'] = 'Ice Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light'] = 'Apollo\'s Staff',
    ['Dark'] = 'Dark Staff'
};

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
-- Phase, Acc, Eva
-- local fenrirChart = {
-- 	"New Moon" = [1, 31],
-- 	"Waxing Crescent" 	Acc-6 	Eva-26
-- 	Waxing Crescent 	Acc-11 	Eva-21
-- 	First Quarter Moon 	Acc-16 	Eva-16
-- 	Waxing Gibbous 	Acc-21 	Eva-11
-- 	Waxing Gibbous 	Acc-26 	Eva-6
-- 	Full Moon Acc-31 	Eva-1
-- 	Waning Gibbous 	Acc-26 	Eva-6
-- 	Waning Gibbous 	Acc-21 	Eva-11
-- 	Last Quarter Moon 	Acc-16 	Eva-16
-- 	Waning Crescent 	Acc-11 	Eva-21
-- 	Waning Crescent 	Acc-6 	Eva-26

-- }
local profile = {}
profile.Sets = {
	Idle = {
		main = staff["Fire"],
		Ammo = "Hedgehog Bomb",
		Head = "Summoner\'s Horn",
		Ear1 = "Beastly earring",
		Ring1 = "Evoker's Ring",
		Ring2 = "Tamas Ring",
		Body = "Yinyang Robe",
		Hands = "Smn. Bracers +1",
		Back = "Summoner's Cape",
		Waist = "Hierarch Belt",
		Legs = "Summoner's Spats",
		Feet = "Summoner's Pgch.",
	},
	perp = {
		Body = "Austere Robe",
		Ring1 = "Evoker's Ring",
		Feet = "Evk. Pigaches +1",
	},
	hmp = {
		Main = "Dark Staff",
		Neck = "Checkered Scarf",
		Body = "Errant Hpl.",
		Legs = "Baron's Slops",
		Feet = "Shep. Boots",
	},
	Nuke = {},
	Cure = {
		main = staff["Light"],
	},
	Stoneskin = {},
	FastCast = {
		Ear2 = "Loquac. Earring",
	},
	petMAB = {
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Body = "Shep. Tunic",
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
	},
	petMacc = {
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Hands = "Smn. Bracers +1",
		Ring1 = "Evoker's Ring",
	},
	BPDelay = {
		Head = "Summoner\'s Horn",
		Hands = "Smn. Bracers +1",
		Body = "Yinyang Robe",
		Legs = "Summoner's Spats",
		Feet = "Summoner's Pgch.",
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
        Ring2 = 'Tamas Ring',
        Back = 'Cape +1',
        Waist = 'Friar\'s Rope',
        Legs = 'Savage Loincloth',
        Feet = 'Savage Gaiters',
    },
	Town = {
		Body = 'Kingdom Aketon',
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
        Main = 'Dark Staff',
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
	"Luncar Cry",
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
	-- local BPName = string.sub(PetAction.Name, 1, string.len(PetAction.Name) - 1)
	-- print(chat.header('HandlePetAction'):append(chat.message(BPName)));
	if MagicBP:contains(BPName) then
		gFunc.EquipSet(profile.Sets.petMAB)
	elseif PhysBP:contains(BPName) then
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

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gSettings.AllowSyncEquip = false
    gcinclude.Initialize();
	SetMacros(bookSMN, pageIdle)
	--AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 1');
end

profile.OnUnload = function() end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
	local game = gData.GetEnvironment();
	local petAction = gData.GetPetAction()
	if petAction ~= nil then
		HandlePetAction(petAction)
		return
	end
	local player = gData.GetPlayer()
	local pet = gData.GetPet()
	if player.Status == "Resting" then
		gFunc.EquipSet(profile.Sets.hmp)
	elseif pet == nil then
		gFunc.EquipSet(profile.Sets.Idle)
	else
		gFunc.EquipSet(profile.Sets.perp)
		gFunc.Equip("main", gcinclude.staves[petElement])
		local env = gData.GetEnvironment()
		if pet.Name == "Carbuncle" then
			gFunc.Equip("hands", "Carbuncle Mitts")
		end
		if env.DayElement == petElement then
			gFunc.Equip("body", "Summoner's Dblt.")
			if pet.Name == "Carbuncle" then
				gFunc.Equip("body", "Yinyang Robe")
			end
		end
		if env.WeatherElement == petElement then
			gFunc.Equip("head", "Summoner's Horn")
		end
	end
	if (game.Time > 6.00) or (game.Time < 18.00) then
		gFunc.EquipSet(profile.Sets.day);
	else
		gFunc.EquipSet(profile.Sets.night);
	end
	gcinclude.CheckDefault();
end

profile.HandleAbility = function()
	local action = gData.GetAction()
	if action.Type:contains("Blood Pact") then
		gFunc.EquipSet(profile.Sets.BPDelay)
	end
end

profile.HandleItem = function() end

profile.HandlePrecast = function()
	gFunc.EquipSet(profile.Sets.FastCast)
end

profile.HandleMidcast = function()
	local petAction = gData.GetPetAction()
	if petAction ~= nil then
		HandlePetAction(petAction)
		return
	end
	local action = gData.GetAction()
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

profile.HandlePreshot = function() end

profile.HandleMidshot = function() end

profile.HandleWeaponskill = function() end

return profile
