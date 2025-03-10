if matches[2] == snd.target then
  if not snd.checkAff("mercy") then
    snd.target_got("mercy")
  elseif not snd.checkAff("masochism") then
    snd.target_got("masochism")
  elseif not snd.checkAff("mania") then
    snd.target_got("mania")
  elseif not snd.checkAff("recklessness") then
    snd.target_got("recklessness")
  end
end

