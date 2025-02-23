function snd.get_moving()
  hp = 100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)
  if snd.can_path and snd.can_cast() and hp >= 85 and snd.moving_to ~= "none" then
    if snd.toggles.gallop then
      if gmcp.Char.Vitals.mounted == "0" then
        snd.mount()
      end
      snd.send("path find " .. snd.moving_to .. snd.sep .. "path go gallop")
    elseif snd.toggles.dash then
      snd.send("path find " .. snd.moving_to .. snd.sep .. "path go dash")
    else
      snd.send("path track " .. snd.moving_to)
    end
    snd.moving_to = "none"
    if ylm.active and ylm.next_zone == "city" then
      ylm.active = false
    end
  end
end

function snd.parseDir(direction)
  if direction == "north" then
    return "n"
  elseif direction == "south" then
    return "s"
  elseif direction == "east" then
    return "e"
  elseif direction == "west" then
    return "w"
  elseif direction == "northeast" then
    return "ne"
  elseif direction == "northwest" then
    return "nw"
  elseif direction == "southeast" then
    return "se"
  elseif direction == "southwest" then
    return "sw"
  elseif direction == "up" then
    return "up"
  elseif direction == "down" then
    return "d"
  else
    return direction
  end
end

function snd.swapDir(direction)
  directions =
    {
      north = "south",
      south = "north",
      east = "west",
      west = "east",
      northeast = "southwest",
      southwest = "northeast",
      northwest = "southeast",
      southeast = "northwest",
      ["in"] = "out",
      out = "in",
      up = "down",
      down = "up",
    }
  return directions[direction]
end