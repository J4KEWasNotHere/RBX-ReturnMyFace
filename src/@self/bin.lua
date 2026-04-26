--TODO:FILE_MAY_BE_OUTDATED(v0.8-beta/unstable-beta)

--!strict
--!native
--!optimize 2

-- BinVersion; 2
-- BinVersions may change in the future due to the removal or addition of new faces,
-- To reduce the reliance on the external bin.

local bin = {src = {}, ext = {}, __init = false}

-- Services
local HttpService = game:GetService("HttpService")
debug.setmemorycategory("ReturnMyFace")

-- Constants
local FALLBACK_DATA = {
	id = 144080495,
	prefix = "rbxassetid://"
}

local EXTERNAL_BIN_URL = "https://pastebin.com/raw/LaipvGnh"

-- Variables
local HTTP_Enabled = HttpService.HttpEnabled

-- Utility

local function tbIsEmpty(t: {[any]: any}): (boolean)
	return next(t) == nil
end

local function addToBin(id0: number|string, id1: number, prefix: string): ()
	local id = tostring(id0)
	bin.src[id] = {
		id = tonumber(id1) or id1,
		prefix = prefix
	}
end 

-- Functions

function bin.get(dynamicHeadId: number): (number, {id: number, prefix: string})
	local source = bin.src[tostring(dynamicHeadId)]
	if source then return source.id, source end
	
	local source_ext = bin.ext[tostring(dynamicHeadId)]
	if source_ext then return source_ext.id, source_ext end
	
	--warn(`[bin]: Could not find Classic Face Id ({dynamicHeadId}), in bin. ({tbIsEmpty(bin.ext) and "External bin empty" or "Unknown id"})`)
	return FALLBACK_DATA.id, FALLBACK_DATA
end

function bin.load(): typeof(bin)
	if bin.__init then return bin end
	bin.__init = true
	
	debug.profilebegin("ReturnMyFace_Bin")
	
	-- external
	if HTTP_Enabled then
		task.spawn(function()
			local success: boolean, result: string

			repeat
				success, result = pcall(function()
					return HttpService:GetAsync(EXTERNAL_BIN_URL, true)
				end)

				task.wait(1)
			until success

			local success2: boolean, result2 = pcall(function()
				return HttpService:JSONDecode(result) --loadstring(`return {result}`)()
			end)

			if success2 and typeof(result2) == "table" then
				bin.ext = result2
			else
				warn(`[bin]: Failed to load external bin. ({result2})`)
			end
		end)
	end
	
	-- local
	addToBin(15938951781, 7699086, "http://www.roblox.com/asset/?id=") -- Silly fun
	addToBin(10725826963, 83017053, "http://www.roblox.com/asset/?id=") -- Man face
	addToBin(11308945948, 7074780, "http://www.roblox.com/asset/?id=") -- Check it
	addToBin(99892364304434, 20052028, "http://www.roblox.com/asset/?id=") -- Prankster
	addToBin(99138878800007, 10749405, "http://www.roblox.com/asset/?id=") -- The Big Dog
	addToBin(98353090718045, 7046277, "http://www.roblox.com/asset/?id=") -- O.o
	addToBin(97709344552035, 110287880, "http://www.roblox.com/asset/?id=") -- Daring Beard
	addToBin(97632554224971, 28878210, "http://www.roblox.com/asset/?id=") -- Adoration
	addToBin(97428175809716, 10678229, "http://www.roblox.com/asset/?id=") -- Bad Dog
	addToBin(97352029854318, 142888113, "http://www.roblox.com/asset/?id=") -- Hockey Face
	addToBin(97339078460937, 12777582, "http://www.roblox.com/asset/?id=") -- Blerg!
	addToBin(97094889503964, 15470952, "rbxassetid://") -- :/
	addToBin(96928121761099, 7076096, "http://www.roblox.com/asset/?id=") -- Chubs
	addToBin(96229607001945, 629929484, "http://www.roblox.com/asset/?id=") -- Bad News Face
	addToBin(96101353612737, 10747452, "http://www.roblox.com/asset/?id=") -- Skeletar
	addToBin(95846667626495, 17137977, "http://www.roblox.com/asset/?id=") -- D=
	addToBin(95632914046000, 29347988, "http://www.roblox.com/asset/?id=") -- Lady Lashes
	addToBin(94278862042697, 3267470325, "rbxassetid://") -- Beaming with Pride
	addToBin(94018341473036, 7074932, "http://www.roblox.com/asset/?id=") -- Uh Oh
	addToBin(92253557119526, 7075412, "http://www.roblox.com/asset/?id=") -- Toothy Grin
	addToBin(91988343407890, 8329410, "http://www.roblox.com/asset/?id=") -- Daring
	addToBin(91653333679335, 10747652, "http://www.roblox.com/asset/?id=") -- eXtreme
	addToBin(91533959945278, 21754586, "http://www.roblox.com/asset/?id=") -- Woebegone
	addToBin(91244610721901, 51241861, "http://www.roblox.com/asset/?id=") -- NOWAI!
	addToBin(90972421756861, 10749222, "http://www.roblox.com/asset/?id=") -- Meow?
	addToBin(90744516180777, 15177471, "http://www.roblox.com/asset/?id=") -- >:3
	addToBin(90451873203405, 66329844, "http://www.roblox.com/asset/?id=") -- O_o
	addToBin(89386362415977, 26619042, "http://www.roblox.com/asset/?id=") -- Sick Day
	addToBin(89282553041208, 19627641, "http://www.roblox.com/asset/?id=") -- Toothless
	addToBin(89187695892355, 416829404, "http://www.roblox.com/asset/?id=") -- Stink Eye
	addToBin(87433619747584, 27412750, "http://www.roblox.com/asset/?id=") -- Smith McCool
	addToBin(86934433811836, 133360891, "http://www.roblox.com/asset/?id=") -- Zombie Face
	addToBin(86738774629878, 2830640563, "rbxassetid://") -- Slithering Smile
	addToBin(86356517393251, 14721752, "http://www.roblox.com/asset/?id=") -- Scarecrow Face
	addToBin(86291986306904, 10747911, "http://www.roblox.com/asset/?id=") -- Retro Smiley
	addToBin(85263717490387, 277939506, "http://www.roblox.com/asset/?id=") -- Furious George
	addToBin(85052333733862, 343187883, "http://www.roblox.com/asset/?id=") -- Don't Wake Me Up
	addToBin(84987410068512, 9250081, "http://www.roblox.com/asset/?id=") -- Mischievous
	addToBin(84930555025211, 508490451, "http://www.roblox.com/asset/?id=") -- Meanie
	addToBin(84836644345665, 7317697, "http://www.roblox.com/asset/?id=") -- Chippy McTooth
	addToBin(84245194729335, 10749546, "http://www.roblox.com/asset/?id=") -- Silence
	addToBin(84091302398052, 7076211, "http://www.roblox.com/asset/?id=") -- RAWR!
	addToBin(82341909053958, 7132019, "http://www.roblox.com/asset/?id=") -- Mysterious
	addToBin(82338169245404, 823018334, "rbxassetid://") -- Sneaky Steve
	addToBin(82223146991621, 84263778542721, "rbxassetid://") -- Snowflake Eyes
	addToBin(82082995456115, 10747401, "http://www.roblox.com/asset/?id=") -- Cute Kitty
	addToBin(81782708135833, 1191121968, "rbxassetid://") -- Red Goof
	addToBin(81215553746040, 16101613, "http://www.roblox.com/asset/?id=") -- Tango
	addToBin(80691818732783, 13478066, "http://www.roblox.com/asset/?id=") -- Walk the Plank You Scurvy Dogs!
	addToBin(80443512686099, 10747392, "http://www.roblox.com/asset/?id=") -- Hypnoface
	addToBin(80295518297031, 2222769550, "rbxassetid://") -- Green Starry Sight
	addToBin(80071849693343, 1772543614, "rbxassetid://") -- Red Ultimate Dragon Face
	addToBin(79654074199621, 1428312511, "rbxassetid://") -- Overjoyed Smile
	addToBin(79558974623236, 24067663, "http://www.roblox.com/asset/?id=") -- Drooling Noob
	addToBin(79029537488886, 209712916, "http://www.roblox.com/asset/?id=") -- Sharpnine's Face of Disappointment
	addToBin(78021109822268, 7389895884, "rbxassetid://") -- Sai-eye Tyler Joseph - Twenty One Pilots
	addToBin(77960831532326, 8560912, "http://www.roblox.com/asset/?id=") -- Anguished
	addToBin(77469189052241, 29296097, "http://www.roblox.com/asset/?id=") -- Daydreaming
	addToBin(77135714844052, 35168482, "http://www.roblox.com/asset/?id=") -- Exclamation Face
	addToBin(76893962596867, 22587893, "http://www.roblox.com/asset/?id=") -- Fast Car
	addToBin(76823042879558, 21439548, "http://www.roblox.com/asset/?id=") -- Toughguy
	addToBin(76416778074549, 11913449, "http://www.roblox.com/asset/?id=") -- Alien Ambassador
	addToBin(75853796532602, 238984437, "http://www.roblox.com/asset/?id=") -- Sly Guy Face
	addToBin(75823789962958, 28118994, "http://www.roblox.com/asset/?id=") -- Not Again!
	addToBin(75567560339502, 115978221, "http://www.roblox.com/asset/?id=") -- I Didn't Eat That Cookie
	addToBin(75548133218243, 19366214, "http://www.roblox.com/asset/?id=") -- Friendly Pirate
	addToBin(74871478197941, 22500052, "http://www.roblox.com/asset/?id=") -- The Friendly Eviscerator
	addToBin(74755350764511, 1191123237, "rbxassetid://") -- Green Goof
	addToBin(74640504208201, 7657592485, "rbxassetid://") -- Diamond Grill - Lil Nas X (LNX)
	addToBin(74295716469720, 255828374, "http://www.roblox.com/asset/?id=") -- Serious Scar Face
	addToBin(74148129448062, 9062612645, "rbxassetid://") -- McLaren Big Grin
	addToBin(73941496344773, 583713423, "http://www.roblox.com/asset/?id=") -- Green Wistful Wink
	addToBin(73772785740330, 273874617, "http://www.roblox.com/asset/?id=") -- Whuut?
	addToBin(72145998109548, 45515545, "http://www.roblox.com/asset/?id=") -- Crazy Happy
	addToBin(71779342356507, 362050947, "http://www.roblox.com/asset/?id=") -- Cheerful Hello
	addToBin(71685666613880, 7506008, "http://www.roblox.com/asset/?id=") -- Blinky
	addToBin(70816272422225, 2222768690, "rbxassetid://") -- Blue Starry Sight
	addToBin(70749170595877, 2620489144, "rbxassetid://") -- Sparkle Time Sparkle Eyes
	addToBin(70555769783156, 14817231, "http://www.roblox.com/asset/?id=") -- =)
	addToBin(16042049101, 236455674, "http://www.roblox.com/asset/?id=") -- Happy Wink
	addToBin(16041877976, 7317606, "http://www.roblox.com/asset/?id=") -- Good Intentioned
	addToBin(15555890394, 7074712, "http://www.roblox.com/asset/?id=") -- Glee
	addToBin(15554865353, 20722053, "http://www.roblox.com/asset/?id=") -- Shiny Teeth
	addToBin(15548514852, 30394849, "http://www.roblox.com/asset/?id=") -- Awesome Face
	addToBin(15381635341, 7075492, "http://www.roblox.com/asset/?id=") -- Lazy Eye
	addToBin(15381595196, 23931977, "http://www.roblox.com/asset/?id=") -- Awkward....
	addToBin(15381533776, 26260786, "http://www.roblox.com/asset/?id=") -- Scarecrow
	addToBin(15093427659, 14861556, "http://www.roblox.com/asset/?id=") -- :P
	addToBin(14719537379, 15431991, "http://www.roblox.com/asset/?id=") -- :3
	addToBin(14532846222, 31117192, "http://www.roblox.com/asset/?id=") -- Skeptic
	addToBin(14525311372, 15885042, "http://www.roblox.com/asset/?id=") -- Cutiemouse
	addToBin(14525047012, 7506025, "http://www.roblox.com/asset/?id=") -- It's Go Time!
	addToBin(14484001930, 8329438, "http://www.roblox.com/asset/?id=") -- Stitchface
	addToBin(14483837205, 20337265, "http://www.roblox.com/asset/?id=") -- Disbelief
	addToBin(14478328247, 7893438453, "rbxassetid://") -- Glittering Eye - Zara Larsson
	addToBin(14478101144, 7317591, "http://www.roblox.com/asset/?id=") -- Slick Fang
	addToBin(14474232253, 7074856, "http://www.roblox.com/asset/?id=") -- Winky
	addToBin(14205289572, 7317691, "http://www.roblox.com/asset/?id=") -- :-o
	addToBin(14205261998, 49045252, "http://www.roblox.com/asset/?id=") -- Monster Face
	addToBin(14193899807, 15365479, "http://www.roblox.com/asset/?id=") -- ^_^
	addToBin(14193774321, 7075459, "http://www.roblox.com/asset/?id=") -- :-/
	addToBin(14193662834, 629933140, "http://www.roblox.com/asset/?id=") -- Big Sad Eyes
	addToBin(14193608834, 14030506, "http://www.roblox.com/asset/?id=") -- I Hate Noobs
	addToBin(14193559599, 14516479, "http://www.roblox.com/asset/?id=") -- Sniffles
	addToBin(14193509240, 12466911, "http://www.roblox.com/asset/?id=") -- Ghostface
	addToBin(14193299178, 7657640018, "rbxassetid://") -- Butterfly Wink - Lil Nas X (LNX)
	addToBin(140710522436831, 7074972, "http://www.roblox.com/asset/?id=") -- Fearless
	addToBin(140599649262491, 22118943, "http://www.roblox.com/asset/?id=") -- Square Eyes
	addToBin(140379648114044, 168332015, "http://www.roblox.com/asset/?id=") -- Angry Zombie
	addToBin(139584395423101, 398671601, "http://www.roblox.com/asset/?id=") -- Monster Smile
	addToBin(139251841457633, 1213444061, "rbxassetid://") -- Catching Snowflakes
	addToBin(138629924353464, 376788359, "http://www.roblox.com/asset/?id=") -- Chill McCool
	addToBin(138526270057654, 5492600700, "rbxassetid://") -- Adorable Puppy
	addToBin(138240577354626, 14123340, "http://www.roblox.com/asset/?id=") -- WHAAAaaa!
	addToBin(13823337209, 15324447, "http://www.roblox.com/asset/?id=") -- >_<
	addToBin(13823254076, 32723156, "http://www.roblox.com/asset/?id=") -- I <3 New Site Theme
	addToBin(13822758815, 8329434, "http://www.roblox.com/asset/?id=") -- Sinister
	addToBin(13822633229, 150070505, "http://www.roblox.com/asset/?id=") -- Huh?
	addToBin(13821486499, 28999175, "http://www.roblox.com/asset/?id=") -- Joyous Surprise
	addToBin(13821330310, 15637705, "http://www.roblox.com/asset/?id=") -- -_-
	addToBin(13821263793, 405704879, "http://www.roblox.com/asset/?id=") -- ROAR!!!
	addToBin(13820838786, 168332209, "http://www.roblox.com/asset/?id= ") -- Not Sure If...
	addToBin(13820744684, 416829065, "http://www.roblox.com/asset/?id=") -- Anime Surprise
	addToBin(138149915421612, 16179600, "http://www.roblox.com/asset/?id=") -- Semi Colon Open Paren
	addToBin(137907115435987, 258192246, "http://www.roblox.com/asset/?id=") -- Tiger Chase Fear Face
	addToBin(13702692127, 32058103, "http://www.roblox.com/asset/?id=") -- So Funny
	addToBin(13702615195, 19398553, "http://www.roblox.com/asset/?id=") -- Grr!
	addToBin(136941665802161, 150070305, "http://www.roblox.com/asset/?id=") -- Awkward Grin
	addToBin(13693003885, 20298933, "http://www.roblox.com/asset/?id=") -- Puck
	addToBin(13692999952, 10749456, "http://www.roblox.com/asset/?id=") -- Finn McCool
	addToBin(13692975981, 616394568, "rbxassetid://") -- Friendly Smile
	addToBin(13692956122, 209715003, "http://www.roblox.com/asset/?id=") -- Suspicious
	addToBin(13692947484, 8560915, "http://www.roblox.com/asset/?id=") -- Stare
	addToBin(13692942131, 15470573, "http://www.roblox.com/asset/?id=") -- Hut Hut Hike!
	addToBin(13692793711, 5924588534, "rbxassetid://") -- Smil Nas X - Lil Nas X (LNX)
	addToBin(13691995281, 21635489, "http://www.roblox.com/asset/?id=") -- Heeeeeey...
	addToBin(13682108684, 29532362, "http://www.roblox.com/asset/?id=") -- Vampire
	addToBin(13682077493, 10749463, "http://www.roblox.com/asset/?id=") -- Dizzy Face
	addToBin(13682064263, 406035320, "http://www.roblox.com/asset/?id=") -- Happy :D
	addToBin(13675180453, 2222767231, "rbxassetid://") -- Hold It In
	addToBin(13675083217, 7074882, "http://www.roblox.com/asset/?id=") -- Drool
	addToBin(136591502467368, 10526794, "http://www.roblox.com/asset/?id=") -- Commando
	addToBin(136438505320111, 7131308, "http://www.roblox.com/asset/?id=") -- Sad Zombie
	addToBin(136298162773288, 2409281591, "rbxassetid://") -- Playful Vampire
	addToBin(134907598627848, 27861351, "http://www.roblox.com/asset/?id=") -- Hilarious
	addToBin(134905828551194, 30394437, "http://www.roblox.com/asset/?id=") -- Friendly Cyclops
	addToBin(134781151861347, 14812835, "http://www.roblox.com/asset/?id=") -- D:
	addToBin(134296548822003, 8329421, "http://www.roblox.com/asset/?id=") -- ZOMG
	addToBin(133805065130462, 147144273, "http://www.roblox.com/asset/?id=") -- Bluffing
	addToBin(133345802828839, 22828283, "http://www.roblox.com/asset/?id=") -- Wink-Blink
	addToBin(133196692848803, 2568579815, "rbxassetid://") -- Snow Queen Smile
	addToBin(132669881188022, 66329524, "http://www.roblox.com/asset/?id=") -- Bored
	addToBin(132617889550403, 20643951, "http://www.roblox.com/asset/?id=") -- Xtreme Happy
	addToBin(132519437289436, 7075130, "http://www.roblox.com/asset/?id=") -- Fang
	addToBin(132476388130903, 280987381, "http://www.roblox.com/asset/?id=") -- Super Happy Joy
	addToBin(132439904394389, 12145229, "http://www.roblox.com/asset/?id=") -- Oh Deer
	addToBin(131828746577082, 16357318, "http://www.roblox.com/asset/?id=") -- NetHack Addict
	addToBin(130958239280173, 21351916, "http://www.roblox.com/asset/?id=") -- Downcast
	addToBin(130433936882245, 494290547, "http://www.roblox.com/asset/?id=") -- Super Super Happy Face
	addToBin(129943611665392, 20909031, "http://www.roblox.com/asset/?id=") -- Sweat It Out
	addToBin(12992668217, 22877631, "http://www.roblox.com/asset/?id=") -- Whistle
	addToBin(129714185728418, 1191124133, "rbxassetid://") -- Golden Bling Braces
	addToBin(12954264879, 209713384, "http://www.roblox.com/asset/?id=") -- Joyful Smile
	addToBin(12946305202, 161124757, "http://www.roblox.com/asset/?id=") -- YAAAWWN
	addToBin(12945410659, 30394483, "http://www.roblox.com/asset/?id=") -- Braces
	addToBin(12939347925, 26424652, "http://www.roblox.com/asset/?id=") -- Know-It-All Grin
	addToBin(12937204578, 226216895, "http://www.roblox.com/asset/?id=") -- Laughing Fun
	addToBin(12937095639, 18151722, "http://www.roblox.com/asset/?id=") -- :]
	addToBin(12936972483, 7987146198, "rbxassetid://") -- Big Grin - Tai Verdes
	addToBin(12936650534, 7893435035, "rbxassetid://") -- Cat Eye - Zara Larsson
	addToBin(129203805231474, 10749449, "http://www.roblox.com/asset/?id=") -- I wuv u
	addToBin(128824320785562, 2225757922, "rbxassetid://") -- Radioactive Beast Mode
	addToBin(128745243924127, 554651972, "rbxassetid://") -- Crazybot 10000
	addToBin(128699516652713, 51241536, "http://www.roblox.com/asset/?id=") -- Obvious Wink
	addToBin(128394984451898, 583712942, "http://www.roblox.com/asset/?id=") -- Blue Wistful Wink
	addToBin(127747170838061, 7046286, "http://www.roblox.com/asset/?id=") -- Classic Goof
	addToBin(127741189804655, 23311760, "http://www.roblox.com/asset/?id=") -- Look At My Nose
	addToBin(127362126459173, 20612916, "http://www.roblox.com/asset/?id=") -- Secret Service
	addToBin(125174710850024, 1772533846, "rbxassetid://") -- Blue Ultimate Dragon Face
	addToBin(122186149619860, 405706600, "http://www.roblox.com/asset/?id=") -- Sharpnine's Face of Joy
	addToBin(121942787157569, 10749488, "http://www.roblox.com/asset/?id=") -- Love
	addToBin(121859443428594, 7074827, "http://www.roblox.com/asset/?id=") -- Classic Vampire
	addToBin(121549276492016, 1772542456, "rbxassetid://") -- Green Ultimate Dragon Face
	addToBin(121139755905822, 15013091, "http://www.roblox.com/asset/?id=") -- :-O
	addToBin(121111747672465, 27134272, "http://www.roblox.com/asset/?id=") -- Goofball
	addToBin(121015622358176, 583713594, "http://www.roblox.com/asset/?id=") -- Purple Wistful Wink
	addToBin(120760417283981, 21796275, "http://www.roblox.com/asset/?id=") -- Glory on the Gridiron
	addToBin(120590400620706, 19396122, "http://www.roblox.com/asset/?id=") -- Jack Frost Face
	addToBin(120354556756689, 405706156, "http://www.roblox.com/asset/?id=") -- XD 2.0
	addToBin(119743588780598, 7699115, "http://www.roblox.com/asset/?id=") -- Sad
	addToBin(119735386706067, 10747810, "http://www.roblox.com/asset/?id=") -- Mr. Chuckles
	addToBin(119665103921086, 108209955, "http://www.roblox.com/asset/?id=") -- Spring Bunny
	addToBin(119055966769182, 22588800, "http://www.roblox.com/asset/?id=") -- Lightning Speaker
	addToBin(118863125370148, 7657648582, "rbxassetid://") -- Devil Nas X - Lil Nas X (LNX)
	addToBin(118411080877177, 209714802, "http://www.roblox.com/asset/?id=") -- Raig Face
	addToBin(11822739674, 209713952, "http://www.roblox.com/asset/?id=") -- Stay Positive
	addToBin(117652972524262, 12188129, "http://www.roblox.com/asset/?id=") -- Demented Mouse
	addToBin(117501539542427, 7076053, "http://www.roblox.com/asset/?id=") -- Hmmm...
	addToBin(117433677847771, 22023001, "http://www.roblox.com/asset/?id=") -- Timmy McPwnage
	addToBin(117174509036478, 66329905, "http://www.roblox.com/asset/?id=") -- Singing
	addToBin(116760990377048, 313548987, "http://www.roblox.com/asset/?id=") -- Pumpkin Face
	addToBin(115499438051492, 25321744, "http://www.roblox.com/asset/?id=") -- Friendly Grin
	addToBin(115319552103544, 29716203, "http://www.roblox.com/asset/?id=") -- Thinking
	addToBin(115176521992817, 14083319, "http://www.roblox.com/asset/?id=") -- Visual Studio Seized Up For 45 Seconds... Again
	addToBin(115023541526893, 32873288, "http://www.roblox.com/asset/?id=") -- Starface
	addToBin(114626389812101, 405705854, "http://www.roblox.com/asset/?id=") -- ¬_¬ 2.0
	addToBin(114624520946660, 1191123763, "rbxassetid://") -- Blue Goof
	addToBin(114449177225002, 295421997, "http://www.roblox.com/asset/?id=") -- Too Much Candy
	addToBin(114031313320461, 334655813, "http://www.roblox.com/asset/?id=") -- Miss Scarlet
	addToBin(113711018795336, 657217430, "rbxassetid://") -- Drill Sergeant
	addToBin(113124428065996, 27003564, "http://www.roblox.com/asset/?id=") -- Old Timer
	addToBin(11308884165, 20418518, "http://www.roblox.com/asset/?id=") -- Err...
	addToBin(11308682721, 25165947, "http://www.roblox.com/asset/?id=") -- Squiggle Mouth
	addToBin(112972242133207, 150070631, "http://www.roblox.com/asset/?id=") -- Awkward Eyeroll
	addToBin(112889275366200, 31317607, "http://www.roblox.com/asset/?id=") -- Alien
	addToBin(112540101225834, 35397044, "http://www.roblox.com/asset/?id=") -- Gigglypuff
	addToBin(11244608373, 12145059, "http://www.roblox.com/asset/?id=") -- Freckles
	addToBin(11236434712, 7074749, "http://www.roblox.com/asset/?id=") -- Chill
	addToBin(111831002498388, 629923753, "http://www.roblox.com/asset/?id=") -- Aghast
	addToBin(11180212350, 3994344171, "rbxassetid://") -- Classic Male Face
	addToBin(11163789916, 616395480, "rbxassetid://") -- The Winning Smile
	addToBin(11159990982, 3994345447, "rbxassetid://") -- Classic Female Face
	addToBin(111481431844333, 243755928, "http://www.roblox.com/asset/?id=") -- Just Trouble
	addToBin(111385667345306, 405706038, "http://www.roblox.com/asset/?id=") -- Smug
	addToBin(110880830101498, 66329994, "http://www.roblox.com/asset/?id=") -- Disapproving Unibrow
	addToBin(108997025427632, 33321688, "http://www.roblox.com/asset/?id=") -- Cheerful Grin
	addToBin(108948147871080, 1016181246, "rbxassetid://") -- Up To Something
	addToBin(108904425571417, 21638407, "http://www.roblox.com/asset/?id=") -- You ated my caik!
	addToBin(108680120161204, 12732236, "http://www.roblox.com/asset/?id=") -- And then we'll take over the world!
	addToBin(108552211476238, 10747371, "http://www.roblox.com/asset/?id=") -- $.$
	addToBin(108310669562716, 23219775, "http://www.roblox.com/asset/?id=") -- Nervous
	addToBin(108225495003775, 7987150722, "rbxassetid://") -- Sunrise Eyes - Tai Verdes
	addToBin(107792872043245, 21311520, "http://www.roblox.com/asset/?id=") -- Sigmund
	addToBin(10725626210, 83022608, "http://www.roblox.com/asset/?id=") -- Woman Face
	addToBin(107149502146344, 141728515, "http://www.roblox.com/asset/?id=") -- Tired Face
	addToBin(106621308776559, 9250431, "http://www.roblox.com/asset/?id=") -- Concerned
	addToBin(106514677750864, 20010294, "http://www.roblox.com/asset/?id=") -- Yawn
	addToBin(106068367626354, 15471076, "http://www.roblox.com/asset/?id=") -- :-[
	addToBin(105415022511145, 30265036, "http://www.roblox.com/asset/?id=") -- Robot Smile
	addToBin(105077647397657, 398670843, "http://www.roblox.com/asset/?id=") -- Nouveau George
	addToBin(105028880420594, 7893441222, "rbxassetid://") -- Heart Gaze - Zara Larsson
	addToBin(104719952469759, 7131482, "http://www.roblox.com/asset/?id=") -- Alright
	addToBin(104065003453878, 129900258, "http://www.roblox.com/asset/?id=") -- ROBLOX Madness Face
	addToBin(103887259460345, 629925029, "http://www.roblox.com/asset/?id=") -- Sadfaic
	addToBin(103521036104932, 158017769, "http://www.roblox.com/asset/?id=") -- Classic Alien Face
	addToBin(102175552451130, 7699096, "http://www.roblox.com/asset/?id=") -- Frightful
	addToBin(101398692064661, 7131857, "http://www.roblox.com/asset/?id=") -- I Am Not Amused
	
	-- v2
	addToBin(13682084865, 6531805594, "rbxassetid://") -- Award Winning Smile
	addToBin(131610962654668, 1772583132, "rbxassetid://") -- Upside Down Face
	addToBin(93075310246069, 42070872, "http://www.roblox.com/asset/?id=") -- Epic Face
	addToBin(122448471631157, 181661839, "http://www.roblox.com/asset/?id=") -- Epic Vampire Face
	addToBin(12930215322, 292668540, "http://www.roblox.com/asset/?id=") -- Lin's Face
	
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	--addToBin(0000000000, 0000000, "http://www.roblox.com/asset/?id=") -- AAAA
	
	debug.profileend()
	return bin
end

return bin.load()
