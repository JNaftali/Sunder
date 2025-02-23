if tonumber(multimatches[1][2])>10 then
  if not snd.toggles.automount then return end
  if gmcp.Char.Vitals.mounted~="0" then return end
  send("qeb recall " .. snd.toggles.mount .. snd.sep .. "recall mount" .. snd.sep .. "quickmount " .. snd.toggles.mount)
end