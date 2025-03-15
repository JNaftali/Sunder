--- @submodule core

snd.current_dodge = nil
snd.waiting.dodge = nil

--- Logic to determine how to dodge.
-- By default this just sticks with dodge_melee but you can return your own answer with snd.dodge_override
-- @function snd.dodge
function snd.dodge()
  local tododge = "none"
  if snd.dodge_override then
    tododge = snd.dodge_override()
  else
    tododge = "melee"
  end

  if tododge ~= "none" and tododge ~= snd.current_dodge and not snd.waiting.dodge then
    snd.send("dodge " .. tododge)
  end
  snd.waiting.dodge = true
  tempTimer(snd.delay(), [[snd.waiting.dodge = false]])
end
