

local possible_skills = {
  "Selfishness",
  "Chameleon",
  "Irongrip",
  "Nightsight",
  "Stalking",
  "Heatsight",
  "Pacing",
  "Gripping"
}
for _, v in pairs(possible_skills) do
  if string.find(matches[2], v) and not table.isMember(snd.skills.raceskills, v) then
  if v == "Gripping" then
   if not table.isMember(snd.skills.raceskills, "Irongrip") then
    table.insert(snd.skills.raceskills,"Irongrip")
   end
  else
   table.insert(snd.skills.raceskills, v)
   end
  end
end