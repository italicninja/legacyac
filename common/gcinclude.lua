local gcinclude = T{};

--[[
Only edit the next two small sections here. See the readme on my github for more information on usages for my profiles.

These are universal sets for things like doomed or asleep; avoid main/sub/range/ammo here.
The second section is a couple basic settings to decide on whether or not to use you the automatic equiping function of idle regen, idle refresh, DT gear etc.
More details in each section.
]]
gcinclude.sets = T{
	Doomed = { -- this set will equip any time you have the doom status
		Ring1 = 'Purity Ring',
		Waist = 'Gishdubar Sash',
    },
	Holy_Water = { -- update with whatever gear you use for the Holy Water item
		Ring1 = 'Purity Ring',
		Ring2 = 'Blenmot\'s Ring',
    },
	Sleeping = { -- this set will auto equip if you are asleep
    },
	Reraise = { -- this set will try to equip when weakened if AutoGear variable is true below or you can force it with /rrset in game
		Head = 'Crepuscular Helm',
		Body = 'Crepuscular Mail',
    },
	Crafting = { -- this set is meant as a default set for crafting, equip using /craftset, be sure to dbl check what rings you want to use
		Head = 'Magnifying Specs.',
		Body = 'Weaver\'s Apron',
		Hands = 'Tanner\'s Gloves',
		Ring1 = 'Artificer\'s Ring',
		Ring2 = 'Craftmaster\'s Ring',
    },
	Zeni = { -- this set is meant as a default set for pictures, equip using /zeniset
		Range = 'Soultrapper 2000',
		Ammo = 'Blank Soulplate',
		Head = 'Malignance Chapeau',
        Neck = 'Bathy Choker +1';
        Ear1 = 'Eabani Earring',
        Ear2 = 'Infused Earring',
        Body = 'Nyame Mail',
        Hands = 'Malignance Gloves',
        Ring1 = 'Vengeful Ring',
        Ring2 = 'Ilabrat Ring',
		Back = 'Solemnity Cape',
        Waist = 'Svelt. Gouriz +1',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
	Fishing = { -- this set is meant as a default set for fishing, equip using /fishset
		Range = 'Halcyon Rod',
		Ring2 = 'Pelican Ring',
    },
};
gcinclude.settings = {
	--[[
	You can also set any of these on a per job basis in the job file in the OnLoad function. See my COR job file to see how this is done
	but as an example you can just put 'gcinclude.settings.RefreshGearMPP = 50;' in your job files OnLoad function to modify for that job only
	]]
	Messages = true; --set to true if you want chat log messages to appear on any /gc command used such as DT, TH, or KITE gear toggles, certain messages will always appear
	AutoGear = true; --set to false if you dont want DT/Regen/Refresh/PetDT gear to come on automatically at the defined %'s here
	WScheck = true; --set to false if you dont want to use the WSdistance safety check
	WSdistance = 4.7; --default max distance (yalms) to allow non-ranged WS to go off at if the above WScheck is true
	RegenGearHPP = 60; -- set HPP to have your idle regen set to come on
	RefreshGearMPP = 70; -- set MPP to have your idle refresh set to come on
	DTGearHPP = 40; -- set HPP to have your DT set to come on
	PetDTGearHPP = 50; -- set pet HPP to have your PetDT set to come on
	MoonshadeTP = 2250; -- this is the TP amount you want to equip EAR2 with moonshade earring when you have less than this amount, set to 0 if you dont want to use at all
	Tele_Ring = 'Tavnazian Ring'; -- put your tele ring in here
};

gcinclude.staves = {
    ['Fire'] = 'Vulkan\'s Staff',
    ['Earth'] = 'Earth Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'Wind Staff',
    ['Ice'] = 'Ice Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light'] = 'Apollo\'s Staff',
    ['Dark'] = 'Dark Staff'
};

--[[
Everything else in this file should not be editted by anyone trying to use my profiles. You really just want to update the various gear sets
in each individual job lua file. Unless you know what you're doing then it is best to leave everything below this line alone, the rest here are various functions and arrays etc.
]]
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');

--gcinclude.AliasList = T{'gcmessages','wsdistance','setcycle','dt','th','kite','meleeset','gcdrain','gcaspir','nukeset','burst','weapon','elecycle','helix','weather','nuke','death','fight','sir','tankset','proc','cj','pupmode','tpgun','cormsg','forcestring','siphon','warpring','telering','rrset','craftset','zeniset','fishset', 'tavring'};
gcinclude.AliasList = T{'gcmessages','meleeset','warpring','craftset', 'tavring'};
gcinclude.Towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]','Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin'};
gcinclude.LockingRings = T{'Echad Ring', 'Trizek Ring', 'Endorsement Ring', 'Capacity Ring', 'Warp Ring','Facility Ring','Dim. Ring (Dem)','Dim. Ring (Mea)','Dim. Ring (Holla)'};
gcinclude.DistanceWS = T{'Flaming Arrow','Piercing Arrow','Dulling Arrow','Sidewinder','Blast Arrow','Arching Arrow','Empyreal Arrow','Refulgent Arrow','Apex Arrow','Namas Arrow','Jishnu\'s Randiance','Hot Shot','Split Shot','Sniper Shot','Slug Shot','Blast Shot','Heavy Shot','Detonator','Numbing Shot','Last Stand','Coronach','Wildfire','Trueflight','Leaden Salute','Myrkr','Dagan','Moonlight','Starlight'};
gcinclude.BstPetAttack = T{'Foot Kick','Whirl Claws','Big Scissors','Tail Blow','Blockhead','Sensilla Blades','Tegmina Buffet','Lamb Chop','Sheep Charge','Pentapeck','Recoil Dive','Frogkick','Queasyshroom','Numbshroom','Shakeshroom','Nimble Snap','Cyclotail','Somersault','Tickling Tendrils','Sweeping Gouge','Grapple','Double Claw','Spinning Top','Suction','Tortoise Stomp','Power Attack','Rhino Attack','Razor Fang','Claw Cyclone','Crossthrash','Scythe Tail','Ripper Fang','Chomp Rush','Pecking Flurry','Sickle Slash','Mandibular Bite','Wing Slap','Beak Lunge','Head Butt','Wild Oats','Needle Shot','Disembowel','Extirpating Salvo','Mega Scissors','Back Heel','Hoof Volley','Fluid Toss','Fluid Spread'};
gcinclude.BstPetMagicAttack = T{'Gloom Spray','Fireball','Acid Spray','Molting Plumage','Cursed Sphere','Nectarous Deluge','Charged Whisker','Nepenthic Plunge'};
gcinclude.BstPetMagicAccuracy = T{'Toxic Spit','Acid Spray','Leaf Dagger','Venom Spray','Venom','Dark Spore','Sandblast','Dust Cloud','Stink Bomb','Slug Family','Intimidate','Gloeosuccus','Spider Web','Filamented Hold','Choke Breath','Blaster','Snow Cloud','Roar','Palsy Pollen','Spore','Brain Crush','Choke Breath','Silence Gas','Chaotic Eye','Sheep Song','Soporific','Predatory Glare','Sudden Lunge','Numbing Noise','Jettatura','Bubble Shower','Spoil','Scream','Noisome Powder','Acid Mist','Rhinowrecker','Swooping Frenzy','Venom Shower','Corrosive Ooze','Spiral Spin','Infrasonics','Hi-Freq Field','Purulent Ooze','Foul Waters','Sandpit','Infected Leech','Pestilent Plume'};
gcinclude.SmnSkill = T{'Shining Ruby','Glittering Ruby','Crimson Howl','Inferno Howl','Frost Armor','Crystal Blessing','Aerial Armor','Hastega II','Fleet Wind','Hastega','Earthen Ward','Earthen Armor','Rolling Thunder','Lightning Armor','Soothing Current','Ecliptic Growl','Heavenward Howl','Ecliptic Howl','Noctoshield','Dream Shroud','Altana\'s Favor','Reraise','Reraise II','Reraise III','Raise','Raise II','Raise III','Wind\'s Blessing'};
gcinclude.SmnMagical = T{'Searing Light','Meteorite','Holy Mist','Inferno','Fire II','Fire IV','Meteor Strike','Conflag Strike','Diamond Dust','Blizzard II','Blizzard IV','Heavenly Strike','Aerial Blast','Aero II','Aero IV','Wind Blade','Earthen Fury','Stone II','Stone IV','Geocrush','Judgement Bolt','Thunder II','Thunder IV','Thunderstorm','Thunderspark','Tidal Wave','Water II','Water IV','Grand Fall','Howling Moon','Lunar Bay','Ruinous Omen','Somnolence','Nether Blast','Night Terror','Level ? Holy'};
gcinclude.SmnHealing = T{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'};
gcinclude.SmnHybrid = T{'Flaming Crush','Burning Strike'};
gcinclude.SmnEnfeebling = T{'Diamond Storm','Sleepga','Shock Squall','Slowga','Tidal Roar','Pavor Nocturnus','Ultimate Terror','Nightmare','Mewing Lullaby','Eerie Eye'};
gcinclude.BluMagPhys = T{'Foot Kick','Sprout Smack','Wild Oats','Power Attack','Queasyshroom','Battle Dance','Feather Storm','Helldive','Bludgeon','Claw Cyclone','Screwdriver','Grand Slam','Smite of Rage','Pinecone Bomb','Jet Stream','Uppercut','Terror Touch','Mandibular Bite','Sickle Slash','Dimensional Death','Spiral Spin','Death Scissors','Seedspray','Body Slam','Hydro Shot','Frenetic Rip','Spinal Cleave','Hysteric Barrage','Asuran Claws','Cannonball','Disseverment','Ram Charge','Vertical Cleave','Final Sting','Goblin Rush','Vanity Dive','Whirl of Rage','Benthic Typhoon','Quad. Continuum','Empty Thrash','Delta Thrust','Heavy Strike','Quadrastrike','Tourbillion','Amorphic Spikes','Barbed Crescent','Bilgestorm','Bloodrake','Glutinous Dart','Paralyzing Triad','Thrashing Assault','Sinker Drill','Sweeping Gouge','Saurian Slide'};
gcinclude.BluMagDebuff = T{'Filamented Hold','Cimicine Discharge','Demoralizing Roar','Venom Shell','Light of Penance','Sandspray','Auroral Drape','Frightful Roar','Enervation','Infrasonics','Lowing','CMain Wave','Awful Eye','Voracious Trunk','Sheep Song','Soporific','Yawn','Dream Flower','Chaotic Eye','Sound Blast','Blank Gaze','Stinking Gas','Geist Wall','Feather Tickle','Reaving Wind','Mortal Ray','Absolute Terror','Blistering Roar','Cruel Joke'};
gcinclude.BluMagStun = T{'Head Butt','Frypan','Tail Slap','Sub-zero Smash','Sudden Lunge'};
gcinclude.BluMagBuff = T{'Cocoon','Refueling','Feather Barrier','Memento Mori','Zephyr Mantle','Warm-Up','Amplification','Triumphant Roar','Saline Coat','Reactor Cool','Plasma Charge','Regeneration','Animating Wail','Battery Charge','Winds of Promy.','Barrier Tusk','Orcish Counterstance','Pyric Bulwark','Nat. Meditation','Restoral','Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'};
gcinclude.BluMagSkill = T{'Metallic Body','Diamondhide','Magic Barrier','Occultation','Atra. Libations'};
gcinclude.BluMagDiffus = T{'Erratic Flutter','Carcharian Verve','Harden Shell','Mighty Guard'};
gcinclude.BluMagCure = T{'Pollen','Healing Breeze','Wild Carrot','Magic Fruit','Plenilune Embrace'};
gcinclude.BluMagEnmity = T{'Actinic Burst','Exuviation','Fantod','Jettatura','Temporal Shift'};
gcinclude.BluMagTH = T{'Actinic Burst','Dream Flower','Subduction'};
gcinclude.Elements = T{'Thunder', 'Blizzard', 'Fire', 'Stone', 'Aero', 'Water', 'Light', 'Dark'};
gcinclude.HelixSpells = T{'Ionohelix', 'Cryohelix', 'Pyrohelix', 'Geohelix', 'Anemohelix', 'Hydrohelix', 'Luminohelix', 'Noctohelix'};
gcinclude.StormSpells = T{'Thunderstorm', 'Hailstorm', 'Firestorm', 'Sandstorm', 'Windstorm', 'Rainstorm', 'Aurorastorm', 'Voidstorm'};
gcinclude.NinNukes = T{'Katon: Ichi', 'Katon: Ni', 'Katon: San', 'Hyoton: Ichi', 'Hyoton: Ni', 'Hyoton: San', 'Huton: Ichi', 'Huton: Ni', 'Huton: San', 'Doton: Ichi', 'Doton: Ni', 'Doton: San', 'Raiton: Ichi', 'Raiton: Ni', 'Raiton: San', 'Suiton: Ichi', 'Suiton: Ni', 'Suiton: San'};
gcinclude.Rolls = T{{'Fighter\'s Roll',5,9}, {'Monk\'s Roll',3,7}, {'Healer\'s Roll',3,7}, {'Corsair\'s Roll',5,9}, {'Ninja Roll',4,8},{'Hunter\'s Roll',4,8}, {'Chaos Roll',4,8}, {'Magus\'s Roll',2,6}, {'Drachen Roll',4,8}, {'Choral Roll',2,6},{'Beast Roll',4,8}, {'Samurai Roll',2,6}, {'Evoker\'s Roll',5,9}, {'Rogue\'s Roll',5,9}, {'Warlock\'s Roll',4,8},
	{'Puppet Roll',3,7}, {'Gallant\'s Roll',3,7}, {'Wizard\'s Roll',5,9}, {'Dancer\'s Roll',3,7}, {'Scholar\'s Roll',2,6},{'Naturalist\'s Roll',3,7}, {'Runeist\'s Roll',4,8}, {'Bolter\'s Roll',3,9}, {'Caster\'s Roll',2,7}, {'Courser\'s Roll',3,9},{'Blitzer\'s Roll',4,9}, {'Tactician\'s Roll',5,8}, {'Allies\' Roll',3,10}, {'Miser\'s Roll',5,7},
	{'Companion\'s Roll',2,10},{'Avenger\'s Roll',4,8},}; -- {name,lucky,unlucky}
gcinclude.RRSET = false;
gcinclude.CraftSet = false;
gcinclude.ZeniSet = false;
gcinclude.FishSet = false;
gcinclude.CORmsg = true;

function gcinclude.Message(toggle, status)
	if toggle ~= nil and status ~= nil then
		print(chat.header('GCinclude'):append(chat.message(toggle .. ' is now ' .. tostring(status))))
	end
end

function gcinclude.SetAlias()
	for _, v in ipairs(gcinclude.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias /' .. v .. ' /lac fwd ' .. v);
	end
end

function gcinclude.ClearAlias()
	for _, v in ipairs(gcinclude.AliasList) do
		AshitaCore:GetChatManager():QueueCommand(-1, '/alias del /' .. v);
	end
end

function gcinclude.SetVariables()
	local player = gData.GetPlayer();

	gcdisplay.CreateToggle('DTset', false);
	gcdisplay.CreateToggle('Kite', false);
	gcdisplay.CreateToggle('TH', false);
	gcdisplay.CreateCycle('MeleeSet', {[1] = 'Default', [2] = 'Hybrid', [3] = 'Acc'});
	if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') or (player.MainJob == 'SCH') or (player.MainJob == 'GEO') then
		gcdisplay.CreateToggle('Burst', true);
		gcdisplay.CreateCycle('NukeSet', {[1] = 'Power', [2] = 'Macc',});
		if (player.MainJob == 'BLM') or (player.MainJob == 'SCH') then
			gcdisplay.CreateCycle('Weapon', {[1] = 'Club', [2] = 'Staff'});
			gcdisplay.CreateCycle('Element', {[1] = 'Thunder', [2] = 'Blizzard', [3] = 'Fire', [4] = 'Stone', [5] = 'Aero', [6] = 'Water', [7] = 'Light', [8] = 'Dark'});
			if (player.MainJob == 'BLM') then
				gcdisplay.CreateToggle('Death', false);
			end
		end
	end
	if (player.MainJob == 'RDM') or (player.MainJob == 'BRD') or (player.MainJob == 'GEO') or (player.MainJob == 'WHM') then
		gcdisplay.CreateToggle('Fight', false);
	end
	if (player.MainJob == 'PLD') or (player.MainJob == 'RUN') then
		gcdisplay.CreateToggle('SIR', true);
		gcdisplay.CreateCycle('TankSet', {[1] = 'Main', [2] = 'MEVA', [3] = 'None'});
	end
	if (player.MainJob == 'SAM') or (player.MainJob == 'NIN') then
		gcdisplay.CreateToggle('PROC', false);
	end
	if (player.MainJob == 'PUP') then
		gcdisplay.CreateCycle('PupMode', {[1] = 'Tank', [2] = 'Melee', [3] = 'Ranger', [4] = 'Mage'});
	end
	if (player.MainJob == 'BRD') then
		gcdisplay.CreateToggle('String', false);
	end
	if (player.MainJob == 'COR') then
		gcdisplay.CreateToggle('TPgun', false);
	end
	if (player.MainJob == 'BLU') then
		gcdisplay.CreateToggle('CJmode', false);
	end
end

function gcinclude.HandleCommands(args)
	if not gcinclude.AliasList:contains(args[1]) then return end

	local player = gData.GetPlayer();
	local toggle = nil;
	local status = nil;

	if args[1] == 'gcmessages' then
		if gcinclude.settings.Messages then
			gcinclude.settings.Messages = false;
			print(chat.header('GCinclude'):append(chat.message('Chat messages are disabled')));
		else
			gcinclude.settings.Messages = true;
			print(chat.header('GCinclude'):append(chat.message('Chat messages are enabled')));
		end
	elseif (args[1] == 'wsdistance') then
		if (tonumber(args[2])) then
			gcinclude.settings.WScheck = true;
			gcinclude.settings.WSdistance = tonumber(args[2]);
			print(chat.header('GCinclude'):append(chat.message('WS Distance is on and set to ' .. gcinclude.settings.WSdistance)));
		else
			gcinclude.settings.WScheck = not gcinclude.settings.WScheck;
			print(chat.header('GCinclude'):append(chat.message('WS distance check is now ' .. tostring(gcinclude.settings.WScheck))));
			print(chat.header('GCinclude'):append(chat.message('Can change WS distance allowed by using /wsdistance ##')));
		end
	elseif (args[1] == 'dt') then
		gcdisplay.AdvanceToggle('DTset');
		toggle = 'DT Set';
		status = gcdisplay.GetToggle('DTset');
    elseif (args[1] == 'meleeset') then
		gcdisplay.AdvanceCycle('MeleeSet');
		toggle = 'Melee Set';
		status = gcdisplay.GetCycle('MeleeSet');
	elseif (#args == 3 and args[1] == 'setcycle') then
		if gcdisplay.SetCycle(args[2], args[3]) then
			toggle = args[2];
			status = gcdisplay.GetCycle(args[2]);
		end
	elseif (args[1] == 'kite') then
		gcdisplay.AdvanceToggle('Kite');
		toggle = 'Kite Set';
		status = gcdisplay.GetToggle('Kite');
	elseif (args[1] == 'th') then
		gcdisplay.AdvanceToggle('TH');
		toggle = 'TH Set';
		status = gcdisplay.GetToggle('TH');
	elseif (args[1] == 'gcaspir') then
		gcinclude.DoAspir();
	elseif (args[1] == 'gcdrain') then
		gcinclude.DoDrain();
	elseif (args[1] == 'warpring') then
		gcinclude.DoWarpRing();
	elseif (args[1] == 'telering') then
		gcinclude.DoTeleRing();
	elseif (args[1] == 'tavring') then
		gcinclude.DoTavRing();
	elseif (args[1] == 'rrset') then
		gcinclude.RRSET = not gcinclude.RRSET;
		toggle = 'Reraise Set';
		status = gcinclude.RRSET;
	elseif (args[1] == 'craftset') then
		gcinclude.CraftSet = not gcinclude.CraftSet;
		toggle = 'Crafting Set';
		status = gcinclude.CraftSet;
	elseif (args[1] == 'zeniset') then
		gcinclude.ZeniSet = not gcinclude.ZeniSet;
		toggle = 'Zeni Pictures Set';
		status = gcinclude.ZeniSet;
	elseif (args[1] == 'fishset') then
		gcinclude.FishSet = not gcinclude.FishSet;
		toggle = 'Fishing Set';
		status = gcinclude.FishSet;
    end
	if (player.MainJob == 'RDM') or (player.MainJob == 'BLM') or (player.MainJob == 'SCH') or (player.MainJob == 'GEO') then
		if (args[1] == 'nukeset') then
			gcdisplay.AdvanceCycle('NukeSet');
			toggle = 'Nuking Gear Set';
			status = gcdisplay.GetCycle('NukeSet');
		elseif (args[1] == 'burst') then
			gcdisplay.AdvanceToggle('Burst');
			toggle = 'Magic Burst Set';
			status = gcdisplay.GetToggle('Burst');
		end
		if (player.MainJob == 'BLM') or (player.MainJob == 'SCH') then
			if (args[1] == 'weapon') then
				gcdisplay.AdvanceCycle('Weapon');
				toggle = 'Mage Weapon';
				status = gcdisplay.GetCycle('Weapon');
			elseif (args[1] == 'elecycle') then
				gcdisplay.AdvanceCycle('Element');
				toggle = 'Spell Element';
				status = gcdisplay.GetCycle('Element');
			elseif (args[1] == 'helix') then
				gcinclude.DoSCHspells('helix');
			elseif (args[1] == 'weather') then
				gcinclude.DoSCHspells('weather');
			elseif (args[1] == 'nuke') then
				gcinclude.DoNukes(args[2]);
			end
			if (player.MainJob == 'BLM') then
				if (args[1] == 'death') then
					gcdisplay.AdvanceToggle('Death');
					toggle = 'BLM Death Set';
					status = gcdisplay.GetToggle('Death');
				end
			end
		end
	end
	if (player.MainJob == 'RDM') or (player.MainJob == 'BRD') or (player.MainJob == 'GEO') or (player.MainJob == 'WHM') then
		if (args[1] == 'fight') then
			if (gcdisplay.GetToggle('Fight') == false) then
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Main');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Sub');
				if (player.MainJob == 'RDM') or (player.MainJob == 'GEO') then AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Range') end
				if (player.MainJob == 'GEO') or (player.MainJob == 'WHM') then AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ammo') end
				gcdisplay.AdvanceToggle('Fight');
				toggle = 'Mage Weapon Lock';
				status = gcdisplay.GetToggle('Fight');
			else
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Main');
				AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Sub');
				if (player.MainJob == 'RDM') or (player.MainJob == 'GEO') then AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable Range') end
				if (player.MainJob == 'GEO') or (player.MainJob == 'WHM') then AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable Ammo') end
				gcdisplay.AdvanceToggle('Fight');
				toggle = 'Mage Weapon Lock';
				status = gcdisplay.GetToggle('Fight');
			end
		end
	end
	if (player.MainJob == 'PLD') or (player.MainJob == 'RUN') then
		if (args[1] == 'sir') then
			gcdisplay.AdvanceToggle('SIR');
			toggle = 'Spell Interupt Set';
			status = gcdisplay.GetToggle('SIR');
		end
		if (args[1] == 'tankset') then
			gcdisplay.AdvanceCycle('TankSet');
			toggle = 'Tank Gear Set';
			status = gcdisplay.GetCycle('TankSet');
		end
	end
	if (player.MainJob == 'SAM') or (player.MainJob == 'NIN') then
		if (args[1] == 'proc') then
			gcdisplay.AdvanceToggle('PROC');
			toggle = 'Low Damage PROC Set';
			status = gcdisplay.GetToggle('PROC');
			if (player.MainJob == 'NIN') then
				if gcdisplay.GetToggle('PROC') == true then
					AshitaCore:GetChatManager():QueueCommand(-1, '/lac disable ammo');
				else
					AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable ammo');
				end
			end
		end
	end
	if (player.MainJob == 'PUP') then
		if (args[1] == 'pupmode') then
			gcdisplay.AdvanceCycle('PupMode');
			toggle = 'Puppet Mode';
			status = gcdisplay.GetCycle('PupMode');
		end
	end
	if (player.MainJob == 'BRD') then
		if (args[1] == 'forcestring') then
			gcdisplay.AdvanceToggle('String');
			toggle = 'BRD Forced Harp';
			status = gcdisplay.GetToggle('String');
		end
	end
	if (player.MainJob == 'COR') then
		if (args[1] == 'tpgun') then
			gcdisplay.AdvanceToggle('TPgun');
			toggle = 'COR Forced TP Gun';
			status = gcdisplay.GetToggle('TPgun');
		elseif (args[1] == 'cormsg') then
			if gcinclude.CORmsg == true then
				gcinclude.CORmsg = false;
				print(chat.header('GCinclude'):append(chat.message('COR Roll messages will no longer show')));
			else
				gcinclude.CORmsg = true;
				print(chat.header('GCinclude'):append(chat.message('COR Roll messages will show now')));
			end
		end
	end
	if (player.MainJob == 'BLU') then
		if (args[1] == 'cj') then
			gcdisplay.AdvanceToggle('CJmode');
			toggle = 'BLU Cruel Joke Set';
			status = gcdisplay.GetToggle('CJmode');
		end
	end
	if (player.MainJob == 'SMN') then
		if (args[1] == 'siphon') then
			gcinclude.DoSiphon();
		end
	end

	if gcinclude.settings.Messages then
		gcinclude.Message(toggle, status)
	end
end

function gcinclude.CheckCommonDebuffs()
	local weakened = gData.GetBuffCount('Weakened');
	local sleep = gData.GetBuffCount('Sleep');
	local doom = (gData.GetBuffCount('Doom'))+(gData.GetBuffCount('Bane'));

	if (sleep >= 1) then gFunc.EquipSet(gcinclude.sets.Sleeping) end
	if (doom >= 1) then	gFunc.EquipSet(gcinclude.sets.Doomed) end
	if (weakened >= 1) then gFunc.EquipSet(gcinclude.sets.Reraise) end
end

function gcinclude.CheckAbilityRecast(check)
	local RecastTime = 0;

	for x = 0, 31 do
		local id = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimerId(x);
		local timer = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(x);

		if ((id ~= 0 or x == 0) and timer > 0) then
			local ability = AshitaCore:GetResourceManager():GetAbilityByTimerId(id);
			if ability == nil then return end
			if (ability.Name[1] == check) and (ability.Name[1] ~= 'Unknown') then
				RecastTime = timer;
			end
		end
	end

	return RecastTime;
end

function gcinclude.CheckLockingRings()
	local rings = gData.GetEquipment();
	if (rings.Ring1 ~= nil) and (gcinclude.LockingRings:contains(rings.Ring1.Name)) then
		local tempRing1 = rings.Ring1.Name;
		gFunc.Equip('Ring1', tempRing1);
	end
	if (rings.Ring2 ~= nil) and (gcinclude.LockingRings:contains(rings.Ring2.Name)) then
		local tempRing2 = rings.Ring2.Name;
		gFunc.Equip('Ring2', tempRing2);
	end
end

function gcinclude.SetTownGear()
	local zone = gData.GetEnvironment();
	local player = gData.GetPlayer();

	if (zone.Area ~= nil) and (gcinclude.Towns:contains(zone.Area) and (player.IsMoving == true)) then
		gFunc.EquipSet('Town')
	end
end

function gcinclude.SetRegenRefreshGear()
	if gcinclude.settings.AutoGear == false then return end

	local player = gData.GetPlayer();
	local pet = gData.GetPet();
	if (player.Status == 'Idle') then
		if (player.HPP < gcinclude.settings.RegenGearHPP ) then gFunc.EquipSet('Idle_Regen') end
		if (player.MPP < gcinclude.settings.RefreshGearMPP ) then gFunc.EquipSet('Idle_Refresh') end
	end
	if (player.HPP < gcinclude.settings.DTGearHPP) then gFunc.EquipSet('Dt') end
	if pet ~= nil then
		if (pet.HPP < gcinclude.settings.PetDTGearHPP) then gFunc.EquipSet('Pet_Dt') end
	end
end

function gcinclude.CheckWsBailout()
	local player = gData.GetPlayer();
	local ws = gData.GetAction();
	local target = gData.GetActionTarget();
	local sleep = gData.GetBuffCount('Sleep');
	local petrify = gData.GetBuffCount('Petrification');
	local stun = gData.GetBuffCount('Stun');
	local terror = gData.GetBuffCount('Terror');
	local amnesia = gData.GetBuffCount('Amnesia');
	local charm = gData.GetBuffCount('Charm');

	if gcinclude.settings.WScheck and not gcinclude.DistanceWS:contains(ws.Name) and (tonumber(target.Distance) > gcinclude.settings.WSdistance) then
		print(chat.header('GCinclude'):append(chat.message('Distance to mob is too far! Move closer or increase WS distance')));
		print(chat.header('GCinclude'):append(chat.message('Can change WS distance allowed by using /wsdistance ##')));
		return false;
	elseif (player.TP <= 999) or (sleep+petrify+stun+terror+amnesia+charm >= 1) then
		return false;
	end

	return true;
end

function gcinclude.CheckSpellBailout()
	local sleep = gData.GetBuffCount('Sleep');
	local petrify = gData.GetBuffCount('Petrification');
	local stun = gData.GetBuffCount('Stun');
	local terror = gData.GetBuffCount('Terror');
	local silence = gData.GetBuffCount('Silence');
	local charm = gData.GetBuffCount('Charm');

	if (sleep+petrify+stun+terror+silence+charm >= 1) then
		return false;
	else
		return true;
	end
end

function gcinclude.DoWarpRing()
	AshitaCore:GetChatManager():QueueCommand(1, '/lac equip ring2 "Warp Ring"');

	local function usering()
		local function forceidleset()
			AshitaCore:GetChatManager():QueueCommand(1, '/lac set Idle');
		end
		AshitaCore:GetChatManager():QueueCommand(1, '/item "Warp Ring" <me>');
		forceidleset:once(8);
	end

	usering:once(11);
end

function gcinclude.DoTeleRing()
	AshitaCore:GetChatManager():QueueCommand(1, '/lac equip ring2 "' .. gcinclude.settings.Tele_Ring .. '"');

	local function usering()
		local function forceidleset()
			AshitaCore:GetChatManager():QueueCommand(1, '/lac set Idle');
		end
		AshitaCore:GetChatManager():QueueCommand(1, '/item "' .. gcinclude.settings.Tele_Ring .. '" <me>');
		forceidleset:once(8);
	end
	usering:once(11);
end

function gcinclude.DoTavRing()

	AshitaCore:GetChatManager():QueueCommand(1, '/lac equip ring2 "Tavnazian Ring"');
	local function usering()
		AshitaCore:GetChatManager():QueueCommand(1, '/item "Tavnazian Ring" <me>');
	end
	usering:once(31); -- Execute after 31s?

	AshitaCore:GetChatManager():QueueCommand(-1, '/lac enable ring2');
end

function gcinclude.DoNukes(tier)
	local cast = gcdisplay.GetCycle('Element');
	if tier == "1" then tier = 'I'
	elseif tier == "2" then tier = 'II'
	elseif tier == "3" then tier = 'III'
	elseif tier == "4" then tier = 'IV'
	elseif tier == "5" then tier = 'V'
	elseif tier == "6" then tier = 'VI'
	end

	if tier == "I" then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. cast .. '" <t>');
	else
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. cast .. ' ' .. tier .. '" <t>');
	end
end

function gcinclude.DoCORmsg(roll)
	if gcinclude.CORmsg == false then return end

	for n = 1, #gcinclude.Rolls do
		if gcinclude.Rolls[n][1] == roll then
			print(chat.header('GCinclude'):append('[' .. chat.warning(roll) .. ']' .. '  [Lucky: ' .. chat.success(gcinclude.Rolls[n][2]) .. ']  [Unlucky: ' .. chat.error(gcinclude.Rolls[n][3]) .. ']'));
		end
	end
end

-- Define the song names, corresponding recast times (in seconds) and type. Order is important Highest Tier -> Lowest
local songs = {
    -- { type = "", id =878, name = 'Dark Threnody II'},
    -- { type = "", id =877, name = 'Light Threnody II'},
    -- { type = "", id =876, name = 'Water Threnody II'},
    -- { type = "", id =875, name = 'Ltng. Threnody II'},
    -- { type = "", id =874, name = 'Earth Threnody II'},
    -- { type = "", id =873, name = 'Wind Threnody II'},
    -- { type = "", id =872, name = 'Ice Threnody II'},
    -- { type = "", id =871, name = 'Fire Threnody II'},
    -- { type = "", id =472, name = 'Pining Nocturne'},
    -- { type = "", id =471, name = 'Foe Lullaby II'},
    -- { type = "", id =470, name = 'Sentinel\'s Scherzo'},
    -- { type = "", id =469, name = 'Adventurer\'s Dirge'},
    -- { type = "", id =468, name = 'Foe Sirvente'},
    -- { type = "", id =467, name = 'Raptor Mazurka'},
    -- { type = "", id =466, name = 'Maiden\'s Virelai'},
    -- { type = "", id =465, name = 'Chocobo Mazurka'},
    -- { type = "", id =464, name = 'Goddess\'s Hymnus'},
    -- { type = "", id =463, name = 'Foe Lullaby'},
    -- { type = "", id =462, name = 'Magic Finale'},
    -- { type = "", id =461, name = 'Dark Threnody'},
    -- { type = "", id =460, name = 'Light Threnody'},
    -- { type = "", id =459, name = 'Water Threnody'},
    -- { type = "", id =458, name = 'Ltng. Threnody'},
    -- { type = "", id =457, name = 'Earth Threnody'},
    -- { type = "", id =456, name = 'Wind Threnody'},
    -- { type = "", id =455, name = 'Ice Threnody'},
    -- { type = "", id =454, name = 'Fire Threnody'},
    -- { type = "", id =453, name = 'Dark Carol II'},
    -- { type = "", id =452, name = 'Light Carol II'},
    -- { type = "", id =451, name = 'Water Carol II'},
    -- { type = "", id =450, name = 'Lightning Carol II'},
    -- { type = "", id =449, name = 'Earth Carol II'},
    -- { type = "", id =448, name = 'Wind Carol II'},
    -- { type = "", id =447, name = 'Ice Carol II'},
    -- { type = "", id =446, name = 'Fire Carol II'},
    -- { type = "", id =445, name = 'Dark Carol'},
    -- { type = "", id =444, name = 'Light Carol'},
    -- { type = "", id =443, name = 'Water Carol'},
    -- { type = "", id =442, name = 'Lightning Carol'},
    -- { type = "", id =441, name = 'Earth Carol'},
    -- { type = "", id =440, name = 'Wind Carol'},
    -- { type = "", id =439, name = 'Ice Carol'},
    -- { type = "", id =438, name = 'Fire Carol'},
    -- { type = "", id =437, name = 'Bewitching Etude'},
    -- { type = "", id =436, name = 'Logical Etude'},
    -- { type = "", id =435, name = 'Sage Etude'},
    -- { type = "", id =434, name = 'Swift Etude'},
    -- { type = "", id =433, name = 'Vital Etude'},
    -- { type = "", id =432, name = 'Uncanny Etude'},
    -- { type = "", id =431, name = 'Herculean Etude'},
    -- { type = "", id =430, name = 'Enchanting Etude'},
    -- { type = "", id =429, name = 'Spirited Etude'},
    -- { type = "", id =428, name = 'Learned Etude'},
    -- { type = "", id =427, name = 'Quick Etude'},
    -- { type = "", id =426, name = 'Vivacious Etude'},
    -- { type = "", id =425, name = 'Dextrous Etude'},
    -- { type = "", id =424, name = 'Sinewy Etude'},
    -- { type = "", id =423, name = 'Massacre Elegy'},
    -- { type = "", id =422, name = 'Carnage Elegy'},
    -- { type = "", id =421, name = 'Battlefield Elegy'},
    { type = "March", id =420, name = 'Victory March', level = 60},
    { type = "March", id =419, name = 'Advancing March', level = 29},
    -- { type = "", id =418, name = 'Protected Aria'},
    -- { type = "", id =417, name = 'Honor March'},
    -- { type = "", id =416, name = 'Cactuar Fugue'},
    -- { type = "", id =415, name = 'Goblin Gavotte'},
    -- { type = "", id =414, name = 'Warding Round'},
    -- { type = "", id =413, name = 'Devotee Serenade'},
    -- { type = "", id =412, name = 'Gold Capriccio'},
    -- { type = "", id =411, name = 'Jester\'s Operetta'},
    -- { type = "", id =410, name = 'Puppet\'s Operetta'},
    -- { type = "", id =409, name = 'Scop\'s Operetta'},
    -- { type = "", id =408, name = 'Shining Fantasia'},
    -- { type = "", id =407, name = 'Chocobo Hum'},
    -- { type = "", id =406, name = 'Herb Pastoral'},
    -- { type = "", id =405, name = 'Fowl Aubade'},
    -- { type = "", id =404, name = 'Dragonfoe Mambo'},
    -- { type = "", id =403, name = 'Sheepfoe Mambo'},
    { type = "Prelude", id =402, name = 'Archer\'s Prelude', level = 51},
    { type = "Prelude", id =401, name = 'Hunter\'s Prelude', level = 31},
    { type = "Madrigal", id =400, name = 'Blade Madrigal', level = 51},
    { type = "Madrigal", id =399, name = 'Sword Madrigal', level = 11},
    { type = "Minuet", id =398, name = 'Valor Minuet V', level = 87},
    { type = "Minuet", id =397, name = 'Valor Minuet IV', level = 63},
    { type = "Minuet", id =396, name = 'Valor Minuet III', level = 43},
    { type = "Minuet", id =395, name = 'Valor Minuet II', level = 23},
    { type = "Minuet", id =394, name = 'Valor Minuet', level = 3},
    -- { type = "", id =393, name = 'Knight\'s Minne V'},
    -- { type = "", id =392, name = 'Knight\'s Minne IV'},
    -- { type = "", id =391, name = 'Knight\'s Minne III'},
    -- { type = "", id =390, name = 'Knight\'s Minne II'},
    -- { type = "", id =389, name = 'Knight\'s Minne'},
    -- { type = "", id =388, name = 'Mage\'s Ballad III'},
    { type = "Ballad", id =387, name = 'Mage\'s Ballad II', level = 55},
    { type = "Ballad", id =386, name = 'Mage\'s Ballad', level = 25},
    { type = "Paeon", id =383, name = 'Army\'s Paeon VI', level = 78},
    { type = "Paeon", id =382, name = 'Army\'s Paeon V', level = 65},
    { type = "Paeon", id =381, name = 'Army\'s Paeon IV', level = 45},
    { type = "Paeon", id =380, name = 'Army\'s Paeon III', level = 35},
    { type = "Paeon", id =379, name = 'Army\'s Paeon II', level = 15},
    { type = "Paeon", id =378, name = 'Army\'s Paeon', level = 5},
    -- { type = "", id =377, name = 'Horde Lullaby II'},
    -- { type = "", id =376, name = 'Horde Lullaby'},
    -- { type = "", id =375, name = 'Foe Requiem VIII', level = 11},
    -- { type = "", id =374, name = 'Foe Requiem VII', level = 76},
    { type = "Requiem", id =373, name = 'Foe Requiem VI', level = 67},
    { type = "Requiem", id =372, name = 'Foe Requiem V', level = 57},
    { type = "Requiem", id =371, name = 'Foe Requiem IV', level = 47},
    { type = "Requiem", id =370, name = 'Foe Requiem III', level = 37},
    { type = "Requiem", id =369, name = 'Foe Requiem II', level = 17},
    { type = "Requiem", id =368, name = 'Foe Requiem', level = 7}
}


-- This expects you to know the spells...
-- Function to cast the appropriate song
function gcinclude.castSong(songType)
	local player = AshitaCore:GetMemoryManager():GetPlayer()
	--print(chat.header('GCinclude'):append(chat.message("My Level " .. player:GetMainJobLevel())));
    for _, song in ipairs(songs) do
        if song.type == songType then
			local songTarget = '<me>'
			if song.type == "Requiem" then
				songTarget = '<t>'
			end
            local macroCommand = '/ma "' .. song.name .. '" '.. songTarget
            local recast = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(song.id);
			--print(chat.header('GCinclude'):append(chat.message("Song ID: " .. song.id .. " Song Name: " .. song.name .. " Recast: " .. recast)));

			if (recast == 0) and (song.level <= player:GetMainJobLevel()) then
				--print(chat.header('GCinclude'):append(chat.message("Recast == 0, So casting " .. song.name)));
				AshitaCore:GetChatManager():QueueCommand(1, macroCommand);
				--print(chat.header('GCinclude'):append(chat.message(song.name)));
                return
            end
        end
    end
end

function gcinclude.DoAspir()
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(247);
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(248);
	local recast3 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(881);

	if (player:GetMainJob() == 4 and player:GetJobPointsSpent(4) >= 550) or (player:GetMainJob() == 21 and player:GetJobPointsSpent(21) >= 550) then
		if (recast3 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aspir III" <t>');
		elseif (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aspir II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aspir" <t>');
		end
	elseif (player:GetMainJob() == 4 and player:GetMainJobLevel() >= 83) or (player:GetMainJob() == 8 and player:GetMainJobLevel() >= 78) or (player:GetMainJob() == 20 and player:GetMainJobLevel() >= 97) or (player:GetMainJob() == 21 and player:GetMainJobLevel() >= 90) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aspir II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aspir" <t>');
		end
	elseif (recast1 == 0) then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Aspir" <t>');
	end
end

function gcinclude.DoDrain()
	local player = AshitaCore:GetMemoryManager():GetPlayer();
	local recast1 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(245);
	local recast2 = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(246);

	if (player:GetMainJob() == 8) then
		if (recast2 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Drain II" <t>');
		elseif (recast1 == 0) then
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "Drain" <t>');
		end
	elseif (recast1 == 0) then
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "Drain" <t>');
	end
end

function gcinclude.DoSCHspells(spell)
	local player = gData.GetPlayer();
	local playerCore = AshitaCore:GetMemoryManager():GetPlayer();
	local e = gcdisplay.GetCycle('Element');
	local key = 0;
	local cast = 'cast';
	local type = {};
	local target = 'me';
	local points = 100;

	if (spell == 'helix') then
		type = gcinclude.HelixSpells;
		target = '<t>';
		points = 1200;
	elseif (spell == 'weather') then
		type = gcinclude.StormSpells;
		target = '<me>';
		points = 100;
	end

	if (player.MainJob == "BLM") then
		if (player.SubJob == "SCH") then
			for k, v in pairs(gcinclude.Elements) do
				if (v == e) then
					key = k;
				end
			end
			for a, b in pairs(type) do
				if (a == key) then
					cast = b;
				end
			end
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. cast .. '" ' .. target);
		end
	elseif (player.MainJob == "SCH") then
		if playerCore:GetJobPointsSpent(20) >= points then
			for k, v in pairs(gcinclude.Elements) do
				if (v == e) then
					key = k;
				end
			end
			for a, b in pairs(type) do
				if (a == key) then
					cast = b;
				end
			end
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. cast .. ' II" ' .. target);
		else
			for k, v in pairs(gcinclude.Elements) do
				if (v == e) then
					key = k;
				end
			end
			for a, b in pairs(type) do
				if (a == key) then
					cast = b;
				end
			end
			AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. cast .. '" ' .. target);
		end
	end
end

function gcinclude.DoSiphon()
	local recast = gcinclude.CheckAbilityRecast('Elemental Siphon');
	if recast ~= 0 then
		print(chat.header('GCinclude'):append(chat.warning('Elemental Siphon not available yet!')));
		return;
	end
	local pet = gData.GetPet();
	local oldpet = 'none';
	local spirit = 'none';
	local spirits = {['Firesday'] = 'Fire Spirit', ['Earthsday'] = 'Earth Spirit', ['Watersday'] = 'Water Spirit', ['Windsday'] = 'Air Spirit', ['Iceday'] = 'Ice Spirit', ['Lightningday'] = 'Thunder Spirit', ['Lightsday'] = 'Light Spirit', ['Darksday'] = 'Dark Spirit'};
	local e = gData.GetEnvironment();

	local function release()
		AshitaCore:GetChatManager():QueueCommand(1, '/ja "Release" <me>');
	end
	local function siphon()
		AshitaCore:GetChatManager():QueueCommand(1, '/ja "Elemental Siphon" <me>');
	end
	local function castavatar()
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. oldpet .. '" <me>');
	end
	local function castspirit()
		AshitaCore:GetChatManager():QueueCommand(1, '/ma "' .. spirit .. '" <me>');
		siphon:once(4);
		release:once(6);
		if oldpet ~= 'none' then
			castavatar:once(8);
		end
	end

	if pet ~= nil then
		oldpet = pet.Name;
		release:once(1);
	end

	for k,v in pairs(spirits) do
		if k == e.Day then
			if v ~= nil then
				spirit = v;
				castspirit:once(3);
			end
		end
	end
end

function gcinclude.DoShadows(spell) -- 1000% credit to zach2good for this function, copy and paste (mostly) from his ashita discord post
	if spell.Name == 'Utsusemi: Ichi' then
		local delay = 2.4
		if gData.GetBuffCount(66) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 66') end):once(delay)
		elseif gData.GetBuffCount(444) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 444') end):once(delay)
		elseif gData.GetBuffCount(445) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 445') end):once(delay)
		elseif gData.GetBuffCount(446) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 446') end):once(delay)
		end
	end

	if spell.Name == 'Utsusemi: Ni' then
		local delay = 0.5
		if gData.GetBuffCount(66) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 66') end):once(delay)
		elseif gData.GetBuffCount(444) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 444') end):once(delay)
		elseif gData.GetBuffCount(445) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 445') end):once(delay)
		elseif gData.GetBuffCount(446) == 1 then
			(function() AshitaCore:GetChatManager():QueueCommand(-1, '/cancel 446') end):once(delay)
		end
	end
end

function gcinclude.DoMoonshade()
	local player = gData.GetPlayer();
	if player.TP < gcinclude.settings.MoonshadeTP then gFunc.Equip('Ear2', 'Moonshade Earring') end
end

function gcinclude.CheckCommonBuffs()
	local action = gData.GetAction();
	if (action.Name == 'Sneak') then
		gFunc.Equip("feet", "Dream Boots +1") -- Sneak +1
		gFunc.Equip("back", "Skulker\'s Cape") -- Sneak +1 // Invis +1
	elseif (action.Name == 'Invisible') then
		gFunc.Equip("hands", "Dream Mittens +1") -- Invis +1
		gFunc.Equip("back", "Skulker\'s Cape") -- Sneak +1 // Invis +1
	end
end

function gcinclude.CheckDefault()
	gcinclude.SetRegenRefreshGear();
	gcinclude.SetTownGear();
    gcinclude.CheckCommonDebuffs();
	gcinclude.CheckLockingRings();
	if (gcinclude.CraftSet == true) then gFunc.EquipSet(gcinclude.sets.Crafting) end
	if (gcinclude.ZeniSet == true) then gFunc.EquipSet(gcinclude.sets.Zeni) end
	if (gcinclude.FishSet == true) then gFunc.EquipSet(gcinclude.sets.Fishing) end
	if (gcinclude.RRSET == true) then gFunc.EquipSet(gcinclude.sets.Reraise) end
	gcdisplay.Update();
end

function gcinclude.Unload()
	gcinclude.ClearAlias();
	gcdisplay.Unload();
end

function gcinclude.Initialize()
	gcdisplay.Initialize:once(2);
	gcinclude.SetVariables:once(2);
	gcinclude.SetAlias:once(2);
end

function gcinclude.DebugChat(msg)
	print(chat.header('GCinclude'):append(chat.message(msg)));
end

return gcinclude;