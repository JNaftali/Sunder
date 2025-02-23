function snd.targetListening()
  local event = gmcp.Comm.Channel.Text
  
  if event.channel~="web" then return end
  if not snd.toggles.listening then return end
  if not table.contains(snd.callers, event.talker) then return end
  
  local rawtext = ansi2string(event.text)
  rawtext = rawtext:gsub(string.char(27) .. [[.-]] .. string.char(4), "")

  matchText = rawtext:lower()
  if
    matchText:find("target:") and
    not matchText:find("list") and
    not matchText:find("calling") and
    not matchText:find("priority") and
    not matchText:find("removed") and
    not matchText:find("next")
  then
    local pattern = [["[ta\.]*?target: [\.\w]*?(\w+)\."]]
    local check = rex.match(matchText, pattern)
    if check and check:lower() ~= snd.target:lower() then
      if snd.toggles.safelistening and sndNDB_getCitizenship(check)==gmcp.Char.Status.city and check:lower()~="teflin" then
        snd.message("Not targeting "..check.." because of safelistening! They're in your city.")
      else
        expandAlias("t " .. check)
      end
    end
  end
end

registerAnonymousEventHandler("gmcp.Comm.Channel.Text", "snd.targetListening")