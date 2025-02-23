snd.adder_attached = false
snd.adder_ready = false
local aff = snd.venomEffect(matches[3])
if matches[2] == snd.target then
  if not snd.checkAff(aff) then
    snd.target_got(aff)
  end
end