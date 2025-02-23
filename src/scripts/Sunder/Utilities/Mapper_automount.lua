local mountTimer

function snd.mapperAutoMount()
  if not snd.toggles.automount then return end
  if gmcp.Char.Vitals.mounted~="0" then return end
  if mountTimer then killTimer(mountTimer) end
  mountTimer =
  tempTimer(
    0,
    function()
      if #mmp.speedWalkPath > 10 then
        send("qeb recall " .. snd.toggles.mount .. snd.sep .. "recall mount" .. snd.sep .. "quickmount " .. snd.toggles.mount)
      end
    end
  )
end

registerAnonymousEventHandler("mmp link externals", "snd.mapperAutoMount")