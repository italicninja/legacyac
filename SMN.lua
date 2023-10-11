---@diagnostic disable: undefined-global

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

local profile = {}
profile.Sets = {
	Idle = {
		main = staff["Fire"],
		Ammo = "Fortune Egg",
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Ear1 = "Beastly earring",
		Ear2 = "Death Earring",
		Body = "Evoker's Doublet",
		Hands = "Evoker's Bracers",
		Ring1 = "Evoker's Ring",
		Ring2 = "Astral Ring",
		Back = "Summoner's Cape",
		Waist = "Hierarch Belt",
		Legs = "Evoker's Spats",
		Feet = "Evoker's Pigaches",
	},
	perp = {
		Body = "Austere Robe",
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
		Ammo = "Morion Tathlum",
		Head = "Evoker's Horn",
		Neck = "Ajari Necklace",
		Body = "Evoker's Doublet",
		Hands = "Mycophile Cuffs",
		Ring1 = "Astral Ring",
		Ring2 = "Astral Ring",
		Back = "Summoner's Cape",
		Waist = "Penitent's Rope",
		Legs = "Evoker's Spats",
		Feet = "Evoker's Pigaches",
	},
	Stoneskin = {},
	FastCast = {},
	petMAB = {
		Head = "Shep. Bonnet",
		Neck = "Smn. Torque",
		Body = "Shep. Tunic",
		Hands = "Austere Cuffs",
		Feet = "Shep. Boots",
	},
	petAtk = {
		Head = "Shep. Bonnet",
		Neck = "Smn. Torque",
		Hands = "Austere Cuffs",
		Feet = "Shep. Boots",
	},
	SummonSkill = {
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Hands = "Austere Cuffs",
	},
	petMacc = {
		Head = "Evoker's Horn",
		Neck = "Smn. Torque",
		Hands = "Austere Cuffs",
		Feet = "Shep. Boots",
	},
	BPDelay = {
		Head = "Austere Hat",
		Hands = "Austere Cuffs",
		Body = "Austere Robe",
	},
	["sync40"] = {
		Main = "Kukulcan's Staff",
		Head = "Horn Hairpin +1",
		Neck = "Justice Badge",
		Ear1 = "Onyx Earring",
		Ear2 = "Onyx Earring",
		Body = "Seer's Tunic +1",
		Hands = "Carbuncle Mitts",
		Ring1 = "Astral Ring",
		Ring2 = "Astral Ring",
		Waist = "Friar's Rope",
		Legs = "Savage Loincloth",
		Feet = "Savage Gaiters",
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
	--There is an extra character somewhere coming through in PetAction.Name
	local BPName = string.sub(PetAction.Name, 1, string.len(PetAction.Name) - 1)
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
	SetMacros(bookSMN, pageIdle)
	--AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 1');
end

profile.OnUnload = function() end

profile.HandleCommand = function(args) end

profile.HandleDefault = function()
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
		gFunc.Equip("main", staff[petElement])
		local env = gData.GetEnvironment()
		if pet.Name == "Carbuncle" then
			gFunc.Equip("hands", "Carbuncle Mitts")
		end
		if env.DayElement == petElement then
			gFunc.Equip("body", "Summoner's Doublet")
		end
		if env.WeatherElement == petElement then
			gFunc.Equip("head", "Summoner's Horn")
		end
	end
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
	end
	if action.ActionType == "Spell" then
		--gFunc.Equip('main', ElementalStaff[action.Element]);
	end
end

profile.HandlePreshot = function() end

profile.HandleMidshot = function() end

profile.HandleWeaponskill = function() end

return profile
