snd.balance = snd.balance or {
  fitness = true,
  shrug = true,
  battle = true,
  hound = true,
  implant = true,
  soulpoison = true,
  purge = true,
  panacea = true,
  cleanse = true,
  fool = true,
  mend = true,
  expunge = true,
  purify = true,
  nimbleness = true,
  momentum = true,
  absorb = true,
  earthenwill = true,
  morph = true,
  ethereal = false,
  furor = true,
  vitality = true,
  kaistrike = true,
  mindcommand = true,
  blackout = true,
  mindpush = true,
  mindcleanse = true,
  madness = true,
  numbness = true,
  pendulum = true,
  battle = true,
  backstab = true,
  rage = true,
  enrich = true,
  regenerate = true,
  crystal = true,
  aeon = true,
  chimera = true,
  envelop = true,
  soulmaster = true,
  sorcery_transfix = true,
  inspire = true,
  bravado = true,
  might = true,
  leech = true,
  shadowsphere = true,
  unbroken = true,
  soulcage = true,
  wand = true,
  fury = true,
  arouse = true, --predator arouse
  ferocity = true, --predator ferocity
  orel = true, --predator orel fly/land
  spider = true, --predator spider web
  feint = true, --predator's feint
  bladesurge = true,
  exploit = true, --executor exploit
  regenerate = true, --survival regenerate
  smash = true, --luminary smash
  restore = true, --restore/vein for asc/bb
  lifebloom = true,
  kaistrike = true,
  foresight = true,
  centrum = true,
  ejawave = true,
  ejamend = true,
  equinox = true,
  eventide = true,
  rattle = true, -- teradrim/tidesage rattle/reprisal
}

snd.waiting = snd.waiting or {
balance = false,
equilibrium = false,
rarm = false,
larm = false,
quest_get = false,
lighting = false,
elixir = false,
herb = false,
vial = false,
salve = false,
moss = false,
writhe = false,
concentrate = false,
tree = false,
focus = false,
clot = false,
parry = false,
queue = false,
who_here = false,
hound = false,
purge = false,
purify = false,
panacea = false,
melting = false,
}
snd.hidden_afflictions = snd.hidden_afflictions or 0

snd.my_limb_damage = snd.my_limb_damage or {
head = 0,
torso = 0,
["left arm"] = 0,
["right arm"] = 0,
["left leg"] = 0,
["right leg"] = 0
}

snd.parrying = snd.parrying or "none"
snd.pipes_lit = snd.pipes_lit or false
snd.emptypipes = snd.emptypipes or
{
  willow = false,
  yarrow = false,
  reishi = false,
}
snd.smokedpipe = snd.smokedpipe or "none"

snd.sent = {

}

snd.cur = snd.cur or {
herb = "",
drink = "",
vial = "",
salve = "",
pipe = ""
}

snd.last = snd.last or {
elixir = "",
herb = "",
smoke = "",
salve = "",
tattoo = "",
focus = "",
tree = ""
}