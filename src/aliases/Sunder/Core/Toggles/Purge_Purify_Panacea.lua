if snd.class == "Praenomen" or snd.class == "Akkari" then
  snd.toggle("purify")
elseif snd.class == "Carnifex" or snd.class == "Warden" then
  snd.toggle("purge")
elseif snd.class == "Shaman" or snd.class == "Alchemist" then
  snd.toggle("panacea")
else
  cecho("You have no purging ability for your class that needs to be turned on.")
end
