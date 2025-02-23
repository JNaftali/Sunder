snd.sep = snd.sep or "\\" -- important! CONFIG SEPARATOR value
--snd.mount = snd.mount or "79667" -- your horse's ID number


snd.faction = snd.faction or "" -- your faction, spirit or shadow
snd.class = snd.class or "" -- your class, used for bashing
snd.templar_direct_dmg = 4
snd.templar_trauma_dmg = 4
snd.limb_dmg_done = snd.limb_dmg_done or 8 -- really only for Templars


snd.stats = snd.stats or { 
  xp = 0,
  last_xp = 0,
  max_xp = 0,
}

snd.toggles = snd.toggles or {
active = true, -- is the system running?
healing = false, -- keep off, incomplete
parrying = true, -- parry most-damaged limb
defenses = true, -- maintain defenses like cloak and density
calling = false, -- call targets on web chat
listening = false, -- listening to targets on web chat
affcalling = false, -- announce afflictions as you hit
chameleon = false, -- use chameleon to change name on qw/who
chameleonPeople = {"Benedicto"},
standing = true, -- like healing, also incomplete
clotting = true, -- incomplete
bashing = false, -- bashing! Woo!
fasthunt = false, -- automatically clear bashing rooms as you enter
generics = false, -- target by name instead of number while bashing
gathering = true, -- pick up corpses/items/gold while bashing
lighting = true, -- light pipes
attacking = false, -- attacking with a PvP function
balecho = true, -- replace balance lines with shorthand
atkecho = true, -- replace attack lines with shorthand
newbie = false, -- use newbie bashing attacks
cobra = false, -- use of tekura cobra stance
lightning = false, -- use Luminary lightning for bashing
gallop = false, -- use gallop while pathing around
dash = false, -- use of dash while pathing around
rockharvest = false, -- are you harvesting rocks?
disperse = false, -- use disperse to remove writhes from allies
questing = false, -- Used to stop you from randomly questing while doing other stuff
vermin = false, -- Toggle vermin walker/basher
goggles = false, -- Do you have the antiquated artifact goggles?
goggle_level = 0,
gauntlet_level = 0,
diagaffs = 3,
nontargetgags = true, -- spam filter for removing non-target curing
fitness = true, -- have access to the fitness ability
shrug = false, -- have access to shrug
purge = false, -- have access to Carnifex/Revenant purge
purify = false, -- have access to Praenomen/Akkari purify
panacea = false, -- have access to Shaman/Alchemist panacea
dome = false,
auto_reject = false,
fastwalk = false,
prism = false,
enrich = false,
gags = true,
targetrune = false,
alerts = false,
followbash = false,
laesan = true, --try to use laesan while predator bashing. If false, will go for Ein-fasit instead.
ascendedtype = "none",
mount = "123456",
automount = false,
highlights = true, --npb highlights
safeListening = true,
bcalling = false,
monomode = "calling",
webAnnounce = false, --whether or not you call out some things on web
}