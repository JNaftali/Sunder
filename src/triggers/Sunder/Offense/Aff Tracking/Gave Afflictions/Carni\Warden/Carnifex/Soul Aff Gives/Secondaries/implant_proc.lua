if snd.toggles.atkecho and snd.toggles.gags and snd.target == matches[2] then 
 deleteLine()
 snd.message("Implant: "..snd.implant)
end
if matches[2] == snd.target then
 snd.target_cured("soul_implant")
 snd.target_got(snd.implant)
 snd.implant = "none"
end
