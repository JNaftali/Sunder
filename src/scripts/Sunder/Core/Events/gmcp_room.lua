function gmcp_room()
  --Check current room
  if snd.my.room ~= gmcp.Room.Info.num then
    --Clear room effects
    --Set current room
    snd.my.room = gmcp.Room.Info.num
    snd.my.room_name = gmcp.Room.Info.name
    snd.my.room_exits = {}
    for ex in pairs(gmcp.Room.Info.exits) do
      table.insert(snd.my.room_exits, ex)
    end
    raiseEvent("sunder_room_updated")
    if snd.toggles.rockharvest then
      snd.send("rockharvest")
    end
    if snd.toggles.plants then
      snd.send("plants")
    end
    if snd.bashing_loaded then
      snd.vermin = 0
      if snd.toggles.vermin then
        enableTimer("moveroom")
      end
      --Initiate fasthunt if necessary
      snd.need_loot = false
      snd.new.room = true
      snd.room_clear = false
      if (snd.my.room == 56222 or snd.my.room == 55185) and snd.toggles.fasthunt then
        -- snd.send("pull lever")
        -- snd.send("west")
      end
      if snd.my.room == 55187 and snd.toggles.fasthunt then
        -- snd.send("pull lever196935")
        -- snd.send("east")
      end
      -- if snd.my.room == 16941 then
        -- snd.send("push bookcase")
      -- end
      if snd.my.room == 16949 then
        snd.send("pull lever")
      end
    end
    if snd.offense_loaded then
      snd.class_hitting = "none"
      snd.person_hitting = "none"
    end
    if snd.ylem_loaded then
      if snd.my.room == tonumber(ylm.next_zone) then
        snd.send("leylines")
      end
    end
  end
  --Check current area
  if snd.my.area ~= gmcp.Room.Info.area then
    if
      snd.my.area ~= "Eld" and
      (
        not (snd.my.area:find("Vortex") and gmcp.Room.Info.area == "the Shattered Vortex") or
        (snd.my.area:find("Vortex") and gmcp.Room.Info.area ~= "the Shattered Vortex")
      )
    then
      --have exceptions for fracture and vortex then
      snd.my.area = gmcp.Room.Info.area
      --Initiate new area targets, if necessary
      snd.new.area = true
      --Set current area
    end
  end
end