if matches[2] == snd.target and snd.checkAff("rot_benign") then
  local afflist = {"spirit", "heat", "wither", "body"}
  for _, v in pairs(afflist) do if not snd.checkAff("rot_"..v) then
    snd.target_got("rot_"..v)
    break
    end
  end
end

