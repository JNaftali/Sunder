if matches[2] == snd.target then
snd.target_cured("black_bile")
snd.target_got("effused_blood")
  if not snd.checkAff("weariness") then
  	snd.target_got("weariness")
  elseif not snd.checkAff("clumsiness") then
  	snd.target_got("clumsiness")
  elseif not snd.checkAff("vomiting") then
  	snd.target_got("vomiting")
  end
end