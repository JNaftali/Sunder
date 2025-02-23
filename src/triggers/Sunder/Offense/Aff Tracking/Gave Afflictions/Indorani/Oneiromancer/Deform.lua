if snd.target == matches[2] then
   snd.deform = false
   if snd.toggles.affcalling then
     snd.send("wt [Indorani] "..snd.target.." DEFORMED. DAMAGE NOW.")
   end   
end