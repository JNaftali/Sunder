

local possible_skills = {
  "Firefly",
  "Moss",
  "Feather",
  "Shield",
  "Mindseye",
  "Hammer",
  "Cloak",
  "Bell",
  "Crystal",
  "Wand",
  "Moon",
  "Cloud",
  "Starburst",
  "Armour",
  "Boar",
  "Flower",
  "Web",
  "Tentacle",
  "Flame",
  "Hourglass",
  "Owl",
  "Brazier",
  "Prism",
  "Anchor",
  "Book",
  "Tree",
  "Mountain",
  "Chameleon",
}

for _, v in pairs(possible_skills) do
  if string.find(matches[2], v) and not table.isMember(snd.skills.tattoos_on_me, v.."Tattoo") then
   table.insert(snd.skills.tattoos_on_me, v.."Tattoo")
  end
end