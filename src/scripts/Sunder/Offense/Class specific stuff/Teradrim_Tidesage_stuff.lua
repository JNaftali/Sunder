local mirrors = {
  ram = "gutsmash",
  crest = "facesmash",
  clobber = "batter",
  pitch = "furor",
  buckle = "fracture",
  gybe = "skullbash",
  wreck = "pulp",
  crack = "slam",
}
local attackDamage = {
  gutsmash = 12,
  facesmash = 13,
  batter = 13.75,
  furor = 7.8,
  fracture = 12,
  skullbash = 16,
  pulp = 9.47,
  slam = 10,
  barrage1 = 4,
  barrage2 = 3.5,
  barrage3 = 3.06
}
--you and limb are used for crunching theoretical damage.
--you should be true if you're the one hitting, limb should be the limb if you're calculating fracture
function snd.calcTeradrimLimbDamage(skill, you, limb)
  local attack = mirrors[skill] or skill
  local damage = attackDamage[attack]
  if attack == "fracture" then
    damage = damage + 4 * math.min(3, snd.limb_bruising[(limb or snd.last_hit_limb)])
  end
  if snd.hitting == "You" or you then
    if snd.toggles.targetrune then
      damage = damage * 1.05
    end
    if snd.runemarkMajor == "red" then
      damage = damage * 1.25
    elseif snd.runemarkMajor == "blue" then
      damage = damage * 0.75
    end
    if snd.runemarkMinor == "red" and attack == "fracture" then
      damage = damage * 1.08
    end
  end
  return round(damage, 2)
end
