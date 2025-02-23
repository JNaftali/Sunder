
function snd.do_tree(current)
 limb = false
 if string.find(current, "_crippled") then
  x = string.gsub(current, "_crippled", "_broken")
  y = string.gsub(current, "_crippled", "_mangled")
  if snd.have_aff(x) or snd.have_aff(y) then
   limb = true
  end
 end
 if not limb and snd.afflictions[current].state == "afflicted" and gmcp.Char.Vitals.tree == "1" and not snd.waiting.tree and snd.can_tattoo() then
  snd.send("touch tree tattoo")
  echo("(touch tree tattoo)")
  snd.last_type = "tree"
  snd.last_item = "send"
  snd.waiting.tree = true
  tempTimer(snd.delay(), [[snd.waiting.tree = false]])
  snd.afflictions[current].state = "waiting"
  startStopWatch(snd.afflictions[current].timer)
 end
end

function snd.do_focus(current)
 if snd.afflictions[current].state == "afflicted" and gmcp.Char.Vitals.focus == "1" and not snd.waiting.focus and snd.can_focus() then
  snd.send("focus")
  echo("(focus)")
  snd.last_type = "focus"
  snd.last_item = "send"
  snd.waiting.focus = true
  tempTimer(snd.delay(), [[snd.waiting.focus = false]])
  snd.afflictions[current].state = "waiting"
  startStopWatch(snd.afflictions[current].timer)
 end
end

function snd.do_clot(current)
 if snd.afflictions[current].state == "afflicted" and not snd.waiting.clot and snd.toggles.clotting then
  mp = gmcp.Char.Vitals.mp
  mid = math.floor((gmcp.Char.Vitals.maxmp/100)*60)
  max = math.floor((mp-mid)/80)
  needed = math.floor(tonumber(gmcp.Char.Vitals.bleeding)/20)
  if max < needed then
   x = max
  else
   x = needed
  end
  if x > 0 then
   snd.send("clot "..x)
   echo("(clot*"..x..")")
   snd.last_type = "clot"
   snd.last_item = "send"
   snd.waiting.clot = true
   tempTimer(snd.delay(), [[snd.waiting.clot = false]])
   snd.afflictions[current].state = "waiting"
   startStopWatch(snd.afflictions[current].timer)
  end
 end
end