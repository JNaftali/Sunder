if matches[2]:find("head") then
  snd.limb_status["head"] = "healed"
  snd.target_cured("head_mangled")
  snd.target_cured("head_broken")
  snd.limb_dmg.head = 0
elseif matches[2]:find("leg") then
  local resetlimbs = {"left leg", "right leg"}
  for k,v in ipairs(resetlimbs) do
    snd.target_cured(v:gsub(" ","_").."_mangled")
    if snd.limb_status[v] == "mangled" then
      snd.limb_status[v] = "broken"
      snd.limb_dmg[v] = 33.33
    end
  end
elseif matches[2]:find("arm") then
  local resetlimbs = {"left arm", "right arm", "torso"}
  for k,v in ipairs(resetlimbs) do
    if snd.limb_status[v] == "mangled" then
      snd.limb_status[v] = "broken"
    end
  end
end