function snd.recklessCheck()
  if
    gmcp.Char.Vitals.hp == gmcp.Char.Vitals.maxhp
    and gmcp.Char.Vitals.mp == gmcp.Char.Vitals.maxmp
    and snd.afflictions.aff_recklessness.state == "healed"
    and snd.afflictions.aff_blackout.state == "healed"
  then
    send("firstaid predict recklessness")
  end
end