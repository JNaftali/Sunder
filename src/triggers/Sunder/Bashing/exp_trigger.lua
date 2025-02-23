snd.stats.max_xp = tonumber(gmcp.Char.Vitals.maxxp)

snd.stats.last_xp = string.gsub(matches[2],",","")
snd.stats.last_xp = tonumber(snd.stats.last_xp)

snd.stats.xp = string.gsub(matches[4],",","")
snd.stats.xp = tonumber(snd.stats.xp)

if snd.toggles.gags then 
  local mobs_to_level = (snd.stats.max_xp - snd.stats.xp) / snd.stats.last_xp
  local mobs_xp_percent = (tonumber(snd.stats.last_xp) / snd.stats.max_xp) * 100
  local xp_point_percent = (25 - (((snd.stats.xp / snd.stats.max_xp) * 100) % 25))
  local mobs_to_point = xp_point_percent / mobs_xp_percent

  deleteLine()
  snd.message("<red>Experience Gained<white>: " .. matches[2] .. " - from " .. matches[3] .. ". Total: " .. matches[4] .. ".")
  snd.message("<white>"..(snd.stats.max_xp - snd.stats.xp).."<yellow>xp [<white>"..round(mobs_to_level,0).."<yellow>] to level!")
   
  local x, y = string.match(gmcp.Char.Status.level, "(.*) (.*)")
  local level = tonumber(x)
  if level > 99 then
    snd.message("<white>"..round(((xp_point_percent/100)*snd.stats.max_xp), 0).."<yellow>xp [<white>"..round(mobs_to_point,0).."<yellow>] to haven point!")
  end
end
   
 
