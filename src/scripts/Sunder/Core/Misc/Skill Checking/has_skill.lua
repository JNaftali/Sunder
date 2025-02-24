--- @submodule core

--- Check to see if you have a skill.
-- Pretty simple, this checks gmcp to see if your character knows a specific skill. You can input the skill name and optionally which skill tree it belongs to.
-- @function hasSkill
-- @param skill string of the skill to check
-- @param tree string of the skilltree to check in
-- @return boolean
function hasSkill(skill, tree)
  if not snd.skills then return false end

  if skill == "Generic" or skill == "Goggle" then return true end

  if snd.assumed_class ~= nil then return true end

  if tree then
    if snd.skills[tree:lower()] and table.contains(snd.skills[tree:lower()], skill) then
      return true
    else
      return false
    end
  else
    if table.contains(snd.skills, skill) then
      return true
    else
      return false
    end
  end
end

