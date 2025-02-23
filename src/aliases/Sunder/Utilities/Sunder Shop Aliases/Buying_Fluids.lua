local fluid_types = {
  venoms = {
  "epteth",
  "gecko",
  "epseth",
  "prefarar",
  "delphinium",
  "digitalis",
  "curare",
  "darkshade",
  "hepafarin",
  "jalk",
  "monkshood",
  "oculus",
  "selarnia",
  "kalmia",
  "xentio",
  "eurypteria",
  "aconite",
  "vernalius",
  "slike",
  "euphorbia",
  "larkspur",
  "oleander",
  "voyria",
  },
  
  elixirs = {
  "health",
  "mana",
  "immunity",
  "levitation",
  "harmony",
  "arcane",
  "speed",
  "vigor",
  "infusion",
  "prudence",
  },
  
  poultices = {
  "mending",
  "mass",
  "restoration",
  "caloric",
  "epidermal",
  "soothing",
  },
}
local refills = matches[2]
for _, v in ipairs(fluid_types[matches[3]]) do
  snd.send("buy "..refills.." refill of " .. v .. " for fluidcache")
end
