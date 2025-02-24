--- @submodule core

--- Parse GMCP for skills.
-- Loads your skills into snd.skills, additionally adds tattoos on your body and your racial skills
-- @function parse_skillsets
function parse_skillsets()
  local tattoos = {}
  local racials = {}
  if snd.skills.tattoos_on_me ~= nil then
    tattoos = snd.skills.tattoos_on_me
  end
  if snd.skills.raceskills ~= nil then
    racials = snd.skills.raceskills
  end

  snd.skills = {}

  snd.skills.raceskills = racials
  snd.skills.tattoos_on_me = tattoos

  for _, set in ipairs(gmcp.Char.Skills.Groups) do
    local skills = string.format("Char.Skills.Get %s", yajl.to_string({ group = set.name }))
    sendGMCP(skills)
  end
  send("\n")
end

