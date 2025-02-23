function snd.handleExpunge()
  for aff in pairs(snd.physical_affs) do
    if snd.checkAff(snd.physical_affs[aff]) then
      if string.find(snd.physical_affs[aff], "_crippled") then
        local string = string.gsub(snd.physical_affs[aff], "_crippled", "")
        string = string:gsub("_", " ")
        if snd.limb_status[string] == "healed" then
          snd.target_cured(snd.physical_affs[aff])
          break
        end
      else
        snd.target_cured(snd.physical_affs[aff])
        break
      end
    end
  end
end