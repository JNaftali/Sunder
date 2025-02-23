snd.skills.raceskills = {}
local heritageSkills = snd.defaultRaceskills[gmcp.Char.Status.heritage]
if heritageSkills then
  for _, skill in pairs(heritageSkills) do
    table.insert(snd.skills.raceskills, skill)
  end
end