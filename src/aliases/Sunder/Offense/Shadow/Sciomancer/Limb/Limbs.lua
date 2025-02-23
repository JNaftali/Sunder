if snd.class == "Sciomancer" then
  snd.starting_attack()
  function snd.attack_function()
    local string = ""
    if not snd.waiting.queue then
      limbs = {"left leg", "right leg", "left arm", "right arm"}
      for limb in pairs(limbs) do
      -- ignore last hit and any limbs being resto'd
        if
          limbs[limb] ~= snd.last_hit_limb and
          limbs[limb] ~= snd.resto_limb
        then
          if targ == "nothing" then
            targ = limbs[limb]
          end
        end
      end

	if snd.used.shield then
   string = string.."cast hew "..snd.target
	elseif gmcp.Char.Vitals.singularity == "" then
		if hasSkill("Genesis") then
			string = string.."gravity genesis tether"
		else
			string = string.."gravity singularity"
		end
  elseif snd.gravity < 5 then
		string = string.."gravity grip "..snd.target
  else
		if not snd.checkAff(targ:gsub(" ","_").."_crippled") then
			string = string.."gravity erupt "..snd.target..targ
		else
			if hasSkill("Transfix") then
				string = string.."cast transfix "..snd.target
			else
				string = string.."cast chill "..snd.target
			end
		end
  end
  if string ~= snd.last_attack and not snd.waiting.queue then
   snd.last_attack = string
   snd.attack(snd.last_attack)
   snd.waiting.queue = true
   tempTimer(snd.delay(), [[snd.waiting.queue = false]])
  end
 end
end
snd.attack_function()
end