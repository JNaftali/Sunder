if matches[2] == snd.target then
 if snd.last_cured ~= "" then
  if snd.cures[snd.last_cure] ~= nil then
   if table.contains(snd.cures[snd.last_cure], snd.last_cured) then
    snd.target_got(snd.last_cured)
	 end
  end
 end
 snd.target_cured("void")
end