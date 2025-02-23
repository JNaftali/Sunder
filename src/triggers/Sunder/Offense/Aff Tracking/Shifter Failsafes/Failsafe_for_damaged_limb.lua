if snd.target == multimatches[1][2] and multimatches[1][3] == multimatches[2][2] then
  local limb = multimatches[2][2]
  snd.limb_status[limb] = "broken"
  snd.limb_dmg[limb] = math.max(snd.limb_dmg[limb],33.33)
  snd.target_got(limb.."_broken")
end