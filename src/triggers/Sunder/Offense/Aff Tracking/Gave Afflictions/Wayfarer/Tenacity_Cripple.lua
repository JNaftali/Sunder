if matches[2] == snd.target then
 snd.last_hit_limb = matches[3]
 snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
 snd.target_got(matches[3]:gsub(" ", "_").."_crippled")
end
disableTrigger("Tenacity Cripple")



