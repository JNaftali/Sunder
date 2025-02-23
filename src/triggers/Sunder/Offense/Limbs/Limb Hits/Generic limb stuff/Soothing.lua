if matches[2] == snd.target then
  snd.target_last_used_salve = "soothing"
  if snd.toggles.atkecho and snd.toggles.gags then
    deleteLine()
    snd.message(matches[2] .. ": soothing " .. matches[3])
  end
  if snd.checkAff("whiplash") and matches[4] == "head" then
    snd.target_cured("whiplash")
    table.insert(snd.last_affs, "whiplash")
  elseif snd.checkAff("backstrain") and matches[4] == "torso" then
    snd.target_cured("backstrain")
    table.insert(snd.last_affs, "backstrain")
  elseif snd.checkAff("muscle_spasms") and matches[4] == "torso" then
    snd.target_cured("muscle_spasms")
    table.insert(snd.last_affs, "muscle_spasms")
  elseif snd.checkAff("stiffness") then
    snd.target_cured("stiffness")
    table.insert(snd.last_affs, "stiffness")
  elseif snd.checkAff("sore_wrist") and matches[4]:find("arm") then
    snd.target_cured("sore_wrist")
    table.insert(snd.last_affs, "sore_wrist")
  elseif snd.checkAff("weak_grip") then
    snd.target_cured("weak_grip")
    table.insert(snd.last_affs, "weak_grip")
  elseif snd.checkAff("sore_ankle") and matches[4]:find("leg") then
    snd.target_cured("sore_ankle")
    table.insert(snd.last_affs, "sore_ankle")
  end
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end