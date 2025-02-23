if snd.target == matches[3] and matches[2] ~= "torso" then
  local limb = string.gsub(matches[2], " ", "_")
  snd.target_got(limb.."_crippled")
end