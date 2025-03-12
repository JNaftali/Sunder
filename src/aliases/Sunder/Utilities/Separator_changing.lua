enableTrigger("Separator Check Update")
if matches[2] ~= nil then send("config separator" .. matches[2]) else send("config separator") end
