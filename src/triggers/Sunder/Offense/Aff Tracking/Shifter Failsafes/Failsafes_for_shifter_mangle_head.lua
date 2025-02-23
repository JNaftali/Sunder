if snd.checkAff("fallen") then
  snd.limb_status["head"] = "healed"
  snd.target_cured("head_mangled")
  snd.target_cured("head_broken")
  snd.limb_dmg.head = 0
end