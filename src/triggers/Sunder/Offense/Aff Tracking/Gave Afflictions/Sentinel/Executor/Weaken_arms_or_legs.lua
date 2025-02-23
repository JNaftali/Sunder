if snd.target == matches[2] then
  if matches[4] == "leg" then
    if not snd.checkAff("lethargy") then
      snd.target_got("lethargy")
      snd.last_affs = {"lethargy"}
    end
    enableTrigger("Sunder Parry")
    enableTrigger("Sunder Dodge")
    enableTrigger("Sunder Rebounding")
  end
end
disableTrigger("Weaken arms or legs")