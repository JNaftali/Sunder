if matches[2] == snd.target then
  local writhe_table = {
    ["state of transfixion"] = "transfix",
    ["bindings"] = "web",
    ["thigh-jawlock"] = "thighlock",
    ["armpit-jawlock"] = "armpitlock",
    ["neck-jawlock"] = "necklock",
    ["entanglement by ropes"] = "ropes",
    ["entanglement by tied ropes"] = "bind",
    ["impalement"] = "impaled",
    ["grappling"] = "grappled",
    ["entanglement by vines"] = "vines",
    }
    
  snd.target_cured("writhe_"..writhe_table[matches[3]])

  if matches[1]:find("jawlock") then
    snd.jawlocked = false
  end
end