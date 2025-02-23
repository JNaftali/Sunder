function snd.handleRestore()
  local limbs = {"right arm", "left arm", "left leg", "right leg"}
 
  for _, v in pairs(limbs) do

    if snd.checkAff(v:gsub(" ", "_").."_crippled") and snd.limb_status[v] == "healed" then
		  snd.target_cured(v:gsub(" ", "_").."_crippled")
    end
  end
end