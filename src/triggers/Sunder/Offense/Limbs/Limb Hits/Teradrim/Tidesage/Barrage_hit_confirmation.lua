if matches[2] == snd.target then
 snd.barrageCounter = snd.barrageCounter + 1
 snd.last_hit_limb = matches[3]
 snd.last_limb_dmg = snd.calcTeradrimLimbDamage("barrage"..snd.barrageCounter)
 snd.took_limb_dmg(matches[3], snd.last_limb_dmg)
 snd.onHit2({"Parry", "Rebounding", "Dodge"})
end
enableTrigger("Barrage prompt turn off")